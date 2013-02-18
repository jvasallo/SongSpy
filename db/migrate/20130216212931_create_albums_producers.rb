class CreateAlbumsProducers < ActiveRecord::Migration
  def up
    create_table :albums_producers, :id => false do |t|
      t.integer :album_id, :null => false
      t.integer :producer_id, :null => false
    end
  end

  def down
    drop_table :albums_producers
  end
end
