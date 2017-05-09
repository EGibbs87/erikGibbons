class FixListingsColumns < ActiveRecord::Migration
  def change
    change_column :listings, :rt_rating, :integer, :null => false, :default => 0
    change_column :listings, :imdb_rating, :integer, :null => false, :default => 0
  end
end
