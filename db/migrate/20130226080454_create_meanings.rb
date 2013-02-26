class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.integer :rating
      t.text :content
      t.integer :song_id
      t.integer :user_id

      t.timestamps
    end
  end
end
