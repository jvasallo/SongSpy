class Producer < ActiveRecord::Base
  attr_accessible :history, :name
  
  has_and_belongs_to_many :albums

  validates_presence_of :name, :history,
      :message => "must be filled!"

end
