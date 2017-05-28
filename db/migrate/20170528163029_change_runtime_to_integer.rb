class ChangeRuntimeToInteger < ActiveRecord::Migration
  def change
    change_column :listings, :runtime, 'integer USING CAST(runtime AS integer)'
  end
end
