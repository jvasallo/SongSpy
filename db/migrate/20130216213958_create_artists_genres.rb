class CreateArtistsGenres < ActiveRecord::Migration
  def up
    create_table :artists_genres, :id => false do |t|
      t.integer :artist_id, :null => false
      t.integer :genre_id, :null => false
    end
  end

  def down
    drop_table :artists_genres
  end
end
