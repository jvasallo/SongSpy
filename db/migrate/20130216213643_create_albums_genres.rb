class CreateAlbumsGenres < ActiveRecord::Migration
  def up
    create_table :albums_genres, :id => false do |t|
      t.integer :album_id, :null => false
      t.integer :genre_id, :null => false
    end
  end

  def down
    drop_table :albums_genres
  end
end
