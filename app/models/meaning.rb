class Meaning < ActiveRecord::Base
  attr_accessible :content, :rating, :song_id, :user_id
 
  belongs_to :song
  belongs_to :user

  validates_presence_of :content, :rating,
      :message => "must be filled!"
  validates_numericality_of :rating, :greater_than_or_equal_to => 0.0, :less_than_or_equal_to => 5.0,
      :message => "must be greater than or equal to 0.0, and less than 5.0!"
end
