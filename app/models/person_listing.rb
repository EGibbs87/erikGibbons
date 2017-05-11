class PersonListing < ActiveRecord::Base
  belongs_to :person
  belongs_to :listing
end