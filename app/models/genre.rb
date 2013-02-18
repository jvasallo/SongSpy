class Genre < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :songs
  has_and_belongs_to_many :albums
end
