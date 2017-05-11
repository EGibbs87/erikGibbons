class AddJoinTables < ActiveRecord::Migration
  def change
    create_table :genres_listings, id: false do |t|
      t.integer :genre_id
      t.integer :listing_id
    end
 
    add_index :genres_listings, :genre_id
    add_index :genres_listings, :listing_id
    
    create_table :listings_people, id: false do |t|
      t.integer :listing_id
      t.integer :person_id
    end
 
    add_index :listings_people, :listing_id
    add_index :listings_people, :person_id
  end
end
