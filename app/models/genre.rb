class Genre < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :songs
  has_and_belongs_to_many :albums

  validates_presence_of :name, :description,
      :message => "must be filled!"
end
