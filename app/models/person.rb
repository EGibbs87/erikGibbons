class Person < ActiveRecord::Base
  #has_many :person_listings, dependent: :destroy
  has_and_belongs_to_many :listings #, :through => :person_listings
end
