class CreateGenreListings < ActiveRecord::Migration
  def change
    create_table :genre_listings do |t|
      t.belongs_to :genre
      t.belongs_to :listing

      t.timestamps null: false
    end
  end
end
