class ChangeBilledNameAndUpdateTables < ActiveRecord::Migration
  def change
    rename_table :top_billeds, :people
    drop_table :top_billed_listings
    remove_column :listings, :genre
    remove_column :listings, :top_billed
    add_column :people, :role, :string
  end
end
