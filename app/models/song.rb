class Song < ActiveRecord::Base
  attr_accessible :album_id, :genre_id, :length, :lyrics, :name, :rating, :artist_id
  
  belongs_to :artist 
  belongs_to :album
  belongs_to :genre

  validates_presence_of :name, :rating, :length,
      :message => "must be filled!"
  validates_numericality_of :rating, :greater_than_or_equal_to => 0.0, :less_than_or_equal_to => 5.0,
      :message => "must be greater than or equal to 0.0, and less than 5.0!"

  validate :check_song_length

  # Making sure songs are stored in minutes
  def check_song_length
    if self.length > 10 then
      self.errors.add(:length, "is longer than 10 minutes...Calm down Free Bird.")
    elsif self.length < 1 then
      self.errors.add(:length, "is shorter than 1 minute...C'MON MAN!")
    end
  end

  def pprint
    "#{artist.name} - #{name} (#{rating} / 5.0)"
  end
 
  def songinfo
    "Length: #{length} \n Lyrics: #{lyrics}"
  end

  # Display the top songs in our system
  def self.top_songs
    Song.all(:order => "rating DESC")
  end                                    
end
