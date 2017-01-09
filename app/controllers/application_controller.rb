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
  
  def add_listing
    l = Listing.where(params.except('genres', 'actors', 'directors', 'location', 'owner', 'controller', 'action', 'application').symbolize_keys).first_or_initialize
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
      
      render :json => {'success' => true }
    else
      render :json => {'success' => false }
    end
  end
  
  private
  
  def listing_params
    params.require(:listing).permit(:title, :media_type, :location, :owner)
  end
end
