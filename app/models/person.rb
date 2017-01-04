class Person < ActiveRecord::Base
  has_many :person_listings, dependent: :destroy
  has_many :listings, :through => :person_listings
end
