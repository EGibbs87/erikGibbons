class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  # send the user to the angular application by default
  def angular
    render "layouts/application", layout: false
  end
  
  def listings
    listings_array = Listing.all.to_json(:include => [:genres, :people])
    
    render :json => listings_array
  end
  
  def genres
    genres_array = Genre.all.to_json
    
    render :json => genres_array
  end
  
  def actors
    actors_array = Person.where(role: "actor").to_json
    
    render :json => actors_array
  end
  
  def directors
    directors_array = Person.where(role: "director").to_json
    
    render :json => directors_array
  end
  
  def writers
    writers_array = Person.where(role: "writer").to_json
    
    render :json => writers_array
  end
  
  def add_rating
    l = Listing.find(params['id'])
    l.update(imdb_rating: params['imdb_rating'])
    puts "====#{l.inspect}"
    
    render :json => "success"
  end
  
  def add_listing
    l = Listing.where(params.except('genres', 'actors', 'directors', 'location', 'owner', 'controller', 'action', 'application', 'imdb_rating', 'rt_rating', 'notes', 'writers', 'runtime').symbolize_keys).first_or_initialize
    if l.location.nil?
      l.location = params['location']
    else
      l.location = "#{l.location}, #{params['location']}" unless l.location.include?(params['location'])
    end
    if l.owner.nil?
      l.owner = params['owner']
    else
      l.owner = "#{l.owner}, #{params['owner']}" unless l.owner.include?(params['owner'])
    end
    l.imdb_rating = params['imdb_rating']
    l.rt_rating = params['rt_rating']
    l.runtime = params['runtime']
    l.notes = params['notes']
    if l.save
      unless params['genres'].nil?
        genres = params['genres'].split(", ")
        genres.each { |g| genre = Genre.where(name: g).first_or_create; l.genres << genre unless l.genres.include?(genre) }
      end
      unless params['actors'].nil?
        actors = params['actors'].split(", ")
        actors.each { |a| actor = Person.where(name: a, role: "actor").first_or_create; l.people << actor unless l.people.include?(actor) }
      end
      unless params['directors'].nil?
        directors = params['directors'].split(", ")
        directors.each { |d| director = Person.where(name: d, role: "director").first_or_create; l.people << director unless l.people.include?(director) }
      end
      unless params['writers'].nil?
        writers = params['writers'].split(", ")
        writers.each { |w| writer = Person.where(name: w, role: "writer").first_or_create; l.people << writer unless l.people.include?(writer) }
      end
      
      render :json => {'success' => true }
    else
      render :json => {'success' => false }
    end
  end
  
  def import_listing
    Listing.import_listing(params['imdb_id'], params['search_title'], params['display_title'], params['year'], params['media'], params['season'], params['location'], params['owner'], params['notes'])
    render :json => {'success' => true }
  end
  
  def upload_file
    file = params["file"]
    spreadsheet = Roo::Excelx.new(file.path)
    
    # cycle through each row of the spreadsheet (after the header)
    range = 2..spreadsheet.last_row
    range.each do |i|
      row = spreadsheet.row(i)
      row[0].nil? ? season = "" : season = row[0]
      title = row[1]
      year = row[2]
      owner = row[4]
      row[5].nil? ? holiday = "" : holiday = row[5]
      form = row[6]
      notes = row[7]
      row[8].nil? ? series = "" : series = row[8]
      imdb_id = row[9]
      
      if season.blank? 
        media = "movie" 
      elsif season.to_s.match(/S\d{2}E\d{2}/)
        media = "episode"
      else
        media = "series"
      end
      
      next if i == 0
      listing = Listing.import_listing(title, year, media, imdb_id, { 'season' => season, 'owner' => owner, 'holiday' => holiday, 'form' => form, 'notes' => notes, 'series' => series })
    end
    puts spreadsheet.last_row
    render :json => {'success' => true }
  end
  
  private
  
  def listing_params
    params.require(:listing).permit(:title, :media_type, :location, :owner, :imdb_rating, :rt_rating, :year, :runtime, :plot, :poster_url, :notes, :imdb_id)
  end
end
