class Listing < ActiveRecord::Base
  has_many :genre_listings, dependent: :destroy
  has_many :genres, :through => :genre_listings
  has_many :person_listings, dependent: :destroy
  has_many :people, :through => :person_listings
end
