class ChangeRtRatingToInt < ActiveRecord::Migration
  def change
    change_column :listings, :rt_rating, :integer
  end
end
