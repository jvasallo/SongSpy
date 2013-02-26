class ChangeRatingFormatInMeaning < ActiveRecord::Migration
  def up
    change_column :meanings, :rating, :float
  end

  def down
    change_column :meanings, :rating, :integer
  end
end
