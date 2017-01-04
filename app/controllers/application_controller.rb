class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # send the user to the angular application by default
  def angular
    render "layouts/application", layout: false
  end
  
  def listings
    listings_array = JSON.parse(Listing.all.to_json)
    listings_array.each do |l| 
      listing = Listing.find(l["id"])
      !listing.genres.empty? ? l["genres"] = listing.genres.map { |g| g.name } : l["genres"] = ["Empty"]
      !listing.people.select { |p| p.role == "actor" }.empty? ? l["actors"] = listing.people.map { |p| p.name if p.role == "actor" }.compact : l["actors"] = ["Empty"]
      !listing.people.select { |p| p.role == "director" }.empty? ? l["directors"] = listing.people.map { |p| p.name if p.role == "director" }.compact : l["directors"] = ["Empty"]
    end
    #listings_array = Listing.all.map { |l| [l, l.genres.map { |g| g.name }, l.people.map { |p| p.name }] }.to_json
    
    render :json => listings_array.to_json
  end
end
