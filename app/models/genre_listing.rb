class GenreListing < ActiveRecord::Base
  belongs_to :genre
  belongs_to :listing
end
