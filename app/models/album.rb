class Album < ActiveRecord::Base
  attr_accessible :artist_id, :label_id, :length, :name, :release_date
  
  belongs_to :label
  belongs_to :artist 
  has_many :songs, :dependent => :destroy
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :producers
end
