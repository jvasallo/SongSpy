class Artist < ActiveRecord::Base
  attr_accessible :birth_date, :label_id, :name, :occupation
  
  belongs_to :label
  has_many :songs
  has_many :albums
end
