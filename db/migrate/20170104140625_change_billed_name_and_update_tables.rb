class ChangeBilledNameAndUpdateTables < ActiveRecord::Migration
  def change
    remove_column :listings, :genre
    remove_column :listings, :top_billed
    add_column :people, :role, :string
  end
end
