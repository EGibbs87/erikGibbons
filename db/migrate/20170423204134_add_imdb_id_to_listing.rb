class AddImdbIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :imdb_id, :string
  end
end
