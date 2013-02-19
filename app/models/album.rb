class Album < ActiveRecord::Base
  attr_accessible :artist_id, :label_id, :length, :name, :release_date, :rating
  
  belongs_to :label
  belongs_to :artist 
  has_many :songs, :dependent => :destroy
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :producers

  validates_presence_of :name, :length, :release_date,
      :message => "must be filled!"

  #
  # Begin Virtual Attributes
  def pprint
    "#{name} -- (#{rating} / 5.0)"
  end
            
  def describe
    "Info: #{description}"
  end
              	    
  def tech_specs
    "OS: #{os}  Screen Size: #{screen_size}  Weight: #{weight}"
  end

  # Display the top songs in our system
  def self.top_five_albums
    Song.all(:order => "rating DESC",
             :limit => 5)
  end
        
end
