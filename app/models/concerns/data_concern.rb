module DataConcern
  def get_ppp
    agent = Mechanize.new

    response = agent.get("https://smartasset.com/insights/ppp-loan-lenders")

    bp = response.at('.blog-post-copy')

    banks = bp.css('h2')[0..-2]

    blurbs = bp.css('h2 + p')

    links = blurbs.map { |b| b.css('a').map { |a| {'text' => a.text, 'href' => a['href'] } } }

    info = [banks.map(&:text), blurbs.map(&:text), links].transpose

    dataset = []

    info.each_with_index do |l,i|
      dataset << { 'id' => i, 'name' => l[0], 'desc' => l[1], 'links' => l[2] }
    end

    dataset.each do |d|
      if d['name'].match(/\*\*/)
        d['name'] = d['name'].gsub(/\s?\*\*/, "")
        d['members-only'] = 'no'
      elsif d['name'].match(/\*/)
        d['name'] = d['name'].gsub(/\s?\*/, "")
        d['members-only'] = 'possibly'
      else
        d['members-only'] = 'yes'
      end
      d['still-active'] = 'yes'
      d['upated'] = '2020-05-11'
    end
  end
end