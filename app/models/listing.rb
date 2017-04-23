class Listing < ActiveRecord::Base
  has_many :genre_listings, dependent: :destroy
  has_many :genres, :through => :genre_listings
  has_many :person_listings, dependent: :destroy
  has_many :people, :through => :person_listings
  
  def self.import_listing(title, year, type, data) # type must be 'movie', 'series', or 'episode'
    # get information from OMDb API
    puts "getting information from OMDb API..."
    url = "http://www.omdbapi.com/?#{URI.encode_www_form('t' => title) }&#{URI.encode_www_form('y' => year) }&#{URI.encode_www_form('type' => type)}"
    begin
      response = Curl.get(url)
      data = response.body
      hash = JSON.parse(data)
    
      if hash["Response"] == "False"
        puts "Could not find listing"
        raise
      end
    rescue
      if url == "http://www.omdbapi.com/?#{URI.encode_www_form('t' => title) }&#{URI.encode_www_form('y' => year) }&#{URI.encode_www_form('type' => type)}"
        puts "#{title} - #{year} failed using year, trying without year...."
        url = "http://www.omdbapi.com/?#{URI.encode_www_form('t' => title) }&#{URI.encode_www_form('type' => type)}"
        ImportFailure.create(title: title, year: year, failed_attempt: "1")
        retry
      else
        puts "could not find record; aborting..."
        ImportFailure.create(title: title, year: year, failed_attempt: "2")
        return false
      end
    end
    
    # find or create movie listing
    # data = { 'season' => season, 'owner' => owner, 'holiday' => holiday, 'form' => form, 'notes' => notes, 'series' => series }
    
    puts "finding/creating movie listing..."
    listing = Listing.where(title: title, year: hash["Year"], runtime: runtime).first_or_create # include runtime to prevent overwriting rare cases (e.g. 2009 Emma)

    if data['season'] == ""
      season = ""
      runtime = hash["Runtime"]
      type = "Movie"
    else
      type = "TV"
      runtime = ""
      if data['season'].match(/\A\d*\z/)
        if season.length == 1
          season = " (S0" + data['season'] + ")"
        else
          season = " (S" + data['season'] + ")"
        end
      else
        season = " (" + data['season'] + ")"
      end
    end
    
    title = data['series'] + title + season
    
    # add owners
    if listing.owner.nil?
      owner = data['owner']
    else
      listing.owner.include?(data['owner']) ? owner = listing.owner : owner = listing.owner + ", " + data['owner']
    end
    
    # add locations
    if listing.locations.nil?
      location = data['form']
    else
      listing.location.include?(data['form']) ? location = listing.location : location = listing.location + ", " + data['location']
    end
    
    # add notes
    if listing.notes.nil?
      notes = data['notes']
    else
      listing.notes.include?(data['notes']) ? notes = listing.notes : notes = listing.notes + "; " + data['notes']
    end
    
    # update listing with all updated params
    listing.update(
      media_type: type,
      notes: notes,
      location: location,
      owner: owner, 
      plot: hash["Plot"], 
      poster_url: hash["Poster"], 
      imdb_rating: hash["Ratings"].find { |r| r["Source"] == "Internet Movie Database" }["Value"], 
      rt_rating: hash["Ratings"].find { |r| r["Source"] == "Rotten Tomatoes" }["Value"]
    )
    
    # generate and associate peripheral data
    genres = hash["Genre"].split(",")
    # add holiday genre
    genres.push(data["holiday"]) unless data["holiday"].nil?
    directors = hash["Director"].split(",")
    writers = hash["Writer"].split(",")
    actors = hash["Actors"].split(",")
    
    puts "finding, creating, and associating genres..."
    genres.each { |genre| g = Genre.where(name: genre).first_or_create; listing.genres << g }
    puts "finding, creating, and associating directors..."
    directors.each { |director| d = Person.where(name: director, role: "director").first_or_create; listing.people << d }
    puts "finding, creating, and associating writers..."
    writers.each { |writer| w = Person.where(name: writer, role: "writer").first_or_create; listing.people << w }
    puts "finding, creating, and associating actors..."
    actors.each { |actor| a = Person.where(name: actor, role: "actor").first_or_create; listing.people << a }
    puts "complete!"
  end
end
