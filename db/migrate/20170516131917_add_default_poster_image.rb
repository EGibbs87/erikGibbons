class AddDefaultPosterImage < ActiveRecord::Migration
  def change
    change_column :listings, :poster_url, :string, :default => "http://www.lacinefest.org/uploads/2/6/7/4/26743637/no-poster_orig.jpeg"
  end
end
