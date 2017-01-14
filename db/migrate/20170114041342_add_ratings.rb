class AddRatings < ActiveRecord::Migration
  def change
    add_column :listings, :imdb_rating, :float
    add_column :listings, :eg_rating, :float
  end
end
