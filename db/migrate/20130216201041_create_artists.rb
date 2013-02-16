class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :occupation
      t.datetime :birth_date
      t.integer :label_id

      t.timestamps
    end
  end
end
