class ChangeImdbRatingToFloat < ActiveRecord::Migration
  def change
    change_column :listings, :imdb_rating, :float
  end
end
