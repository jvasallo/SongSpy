class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :length
      t.datetime :release_date
      t.integer :artist_id
      t.integer :label_id

      t.timestamps
    end
  end
end
