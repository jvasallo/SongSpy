class Song < ActiveRecord::Base
  attr_accessible :album_id, :genre_id, :length, :lyrics, :name, :rating, :artist_id
  
  belongs_to :artist 
  belongs_to :album
  belongs_to :genre
end
