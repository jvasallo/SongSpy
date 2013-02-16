class Album < ActiveRecord::Base
  attr_accessible :artist_id, :label_id, :length, :name, :release_date
end
