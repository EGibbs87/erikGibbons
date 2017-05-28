class ChangeRuntimeToInteger < ActiveRecord::Migration
  def change
    change_column :listings, :runtime, :integer
  end
end
