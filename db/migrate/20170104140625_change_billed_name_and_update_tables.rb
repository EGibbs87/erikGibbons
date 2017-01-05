class ChangeBilledNameAndUpdateTables < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :role
      t.timestamps
    end
    remove_column :listings, :genre
    remove_column :listings, :top_billed
  end
end
