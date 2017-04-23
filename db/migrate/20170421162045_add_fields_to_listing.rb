class AddFieldsToListing < ActiveRecord::Migration
  def change
    add_column :listings, :year, :string
    add_column :listings, :runtime, :string
    add_column :listings, :plot, :text
    add_column :listings, :poster_url, :text
    add_column :listings, :rt_rating, :string
  end
end
