class Song < ActiveRecord::Base
  attr_accessible :album_id, :genre_id, :length, :lyrics, :name, :rating
end
