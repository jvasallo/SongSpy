class Label < ActiveRecord::Base
  attr_accessible :founded_date, :founder, :location, :name
  
  has_many :albums, :dependent => :destroy
  has_many :artists, :dependent => :destroy
end
