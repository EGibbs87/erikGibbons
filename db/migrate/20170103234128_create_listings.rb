class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :media_type
      t.string :genre
      t.string :location
      t.string :owner
      t.string :top_billed

      t.timestamps null: false
    end
  end
end
