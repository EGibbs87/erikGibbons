class MakeZeroDefaultRating < ActiveRecord::Migration
  def change
    change_column_default :listings, :imdb_rating, 0
    change_column_default :listings, :rt_rating, 0
  end
end
