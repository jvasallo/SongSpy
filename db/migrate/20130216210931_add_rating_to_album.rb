class AddRatingToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :rating, :float
  end
end
