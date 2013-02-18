class Producer < ActiveRecord::Base
  attr_accessible :history, :name
  
  has_and_belongs_to_many :albums
end
