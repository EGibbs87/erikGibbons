class ChangeRtRatingToInt < ActiveRecord::Migration
  def change
    change_column :listings, :rt_rating, 'integer USING CAST(rt_rating AS integer)'
  end
end
