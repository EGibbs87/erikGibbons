class Genre < ActiveRecord::Base
  #has_many :genre_listings, dependent: :destroy
  has_and_belongs_to_many :listings #, :through => :genre_listings
end
