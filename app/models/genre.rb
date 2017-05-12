class Genre < ActiveRecord::Base
  has_many :genre_listings, dependent: :destroy
  has_many :listings, :through => :genre_listings
end
