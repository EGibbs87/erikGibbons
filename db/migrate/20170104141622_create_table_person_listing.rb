class CreateTablePersonListing < ActiveRecord::Migration
  def change
    create_table :person_listings do |t|
      t.belongs_to :person
      t.belongs_to :listing
    end
  end
end
