#./app/controllers/concerns/get_data.rb
module GetData
  extend ActiveSupport::Concern

  def get_episode_info(imdb_id, show_title)
    def episode_data(data)
      output = []
      begin
        season = data.search('a[data-testid="tab-season-entry"]').css('.ipc-tab--active')[0].text
        episodes = data.css('.episode-item-wrapper')
        episodes.each do |ep|
          link = ep.css('.ipc-title-link-wrapper')[0]
          ep_data = {}
          ep_data['season'] = season
          ep_data['ep_number'] = link.attributes['href'].text.match(/ttep_ep(\d{1,3})/)[1]
          ep_data['title'] = link.text.match(/ ∙ (.*)/)[1]
          ep_data['imdb_id'] = link.attributes['href'].text.match(/tt\d{1,10}/)[0]
          begin
            air_date_reg = ep.css('h4')[0].next.text[5..-1]
            if air_date_reg.nil?
              # break if no date is listed
              next
            end
            air_date = DateTime.strptime(air_date_reg, "%b %d, %Y").strftime("%F")
            if air_date > Date.today.strftime("%F")
              # break if date is in the future
              next
            end
            ep_data['air_date'] = air_date
          rescue
            ep_data['air_date'] = 'Could not parse'
          end
          ep_data['rating'] = ep.search('div[data-testid="ratingGroup--container"]')[0].search('span')[0].attributes['aria-label'].text.match(/IMDb rating: (.*)/)[1]
          output << ep_data
        end

        return output
      rescue => error
        puts error.backtrace
        return 'invalid season'
      end
    end

    begin
      output = {}

      agent = Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome'; agent.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.31" }

      # first season and set seasons
      response = agent.get("https://www.imdb.com/title/#{imdb_id}/episodes/?season=1")
      s_list = response.search('a[data-testid="tab-season-entry"]')
      sel = s_list.css('.ipc-tab--active')[0].text
      seasons = s_list.map { |s| s.text }

      ep_data = episode_data(response)

      output[sel] = ep_data.map { |ep| {"Show Title" => show_title, "Title" => ep["title"], "Released" => ep["air_date"], "Episode" => ep["ep_number"], "imdbRating" => ep["rating"], "imdbId" => ep["imdb_id"]} }

      # get data for each other season
      (seasons - [sel]).each do |season|
        response = agent.get("https://www.imdb.com/title/#{imdb_id}/episodes/?season=#{season}")
        
        ep_data = episode_data(response)
        if ep_data == "break"
          break
        elsif ep_data == "invalid season"
          next
        else
          output[season] = ep_data.map { |ep| {"Show Title" => show_title, "Title" => ep["title"], "Released" => ep["air_date"], "Episode" => ep["ep_number"], "imdbRating" => ep["rating"], "imdbId" => ep["imdb_id"]} }
        end
      end
    rescue => error
      puts $!.backtrace
      output = { '1': [{ "Show Title" => "Error retrieving show data", "Title" => "N/A", "Released" => '1970-01-01', "Episode" => "1", "imdbRating" => "0.0", "imdbId" => "N/A" }]}
    end

    return output
  end

  def get_omdb_info(q)
    agent = Mechanize.new

    response = agent.get("https://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&#{q}&type=series")

    return JSON.parse(response.body)
  end

  def get_info_ng2(q)
    agent = Mechanize.new

    res = agent.get("https://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&#{q}")

    basic_info = JSON.parse(res.body)

    if basic_info["Response"] == "False"
      return basic_info
    end

    def episode_data(data)
      output = []
      season_base = data.css('#episode_top').text.match(/Season\p{Zs}(.*)/)
      return "invalid season" if season_base.nil? # skip if season doesn't parse correctly
      season = season_base[1]
      episodes = data.css('.list_item')
      episodes.each do |ep|
        info = ep.css('.info')
        ep_data = {}
        ep_data['season'] = season
        ep_data['ep_number'] = info.css('meta').attr('content').value
        ep_data['title'] = info.css('strong').text
        ep_data['imdb_id'] = info.css('strong').css('a').attr('href').value.match(/tt\d{1,10}/)[0]
        air_date_reg = info.css('.airdate')[0].text.match(/\d{1,2}\s[A-Za-z]{3}\.?\s\d{4}/)
        if air_date_reg.nil?
          # break if no date is listed
          next
        end
        air_date_raw = air_date_reg[0].gsub(".", "")
        air_date = DateTime.strptime(air_date_raw, "%d %b %Y").strftime("%F")
        if air_date > Date.today.strftime("%F")
          # break if date is in the future
          next
        end
        ep_data['air_date'] = air_date
        ep_data['rating'] = info.css('.ipl-rating-star.small .ipl-rating-star__rating').text
        output << ep_data
      end

      return output
    end

    output = []

    # first season and set seasons
    response = agent.get("https://www.imdb.com/title/#{basic_info['imdbID']}/episodes/_ajax?season=1")
    s_list = response.css('#bySeason')
    sel = s_list.css('[selected=selected]')[0].attr('value')
    seasons = s_list.css('option').map { |o| o.attr('value') }

    ep_data = episode_data(response)

    output << ep_data.map { |ep| {"showTitle" => basic_info['Title'], "epTitle" => ep["title"], "released" => ep["air_date"], "season" => sel, "epNumber" => ep["ep_number"], "imdbRating" => ep["rating"], "imdbId" => ep["imdb_id"] } }

    # get data for each other season
    (seasons - [sel]).each do |season|
      response = agent.get("https://www.imdb.com/title/#{basic_info['imdbID']}/episodes/_ajax?season=#{season}")
      
      ep_data = episode_data(response)
      if ep_data == "break"
        break
      elsif ep_data == "invalid season" || ep_data.empty?
        next
      else
        output << ep_data.map { |ep| {"showTitle" => basic_info['Title'], "epTitle" => ep["title"], "released" => ep["air_date"], "season" => season, "epNumber" => ep["ep_number"], "imdbRating" => ep["rating"], "imdbId" => ep["imdb_id"] } }
      end
    end

    return output
  end
end