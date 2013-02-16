class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.string :founder
      t.datetime :founded_date
      t.string :location

      t.timestamps
    end
  end
end
