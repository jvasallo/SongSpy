class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.float :rating
      t.integer :length
      t.text :lyrics
      t.integer :album_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
