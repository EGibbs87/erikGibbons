class CreateImportFailures < ActiveRecord::Migration
  def change
    create_table :import_failures do |t|
      t.string :title
      t.string :year
      t.string :failed_attempt

      t.timestamps null: false
    end
  end
end
