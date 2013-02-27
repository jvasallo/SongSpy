class Album < ActiveRecord::Base
  attr_accessible :artist_id, :label_id, :length, :name, :release_date, :rating, :extension, :photo

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
    Album.all(:order => "rating DESC",
              :limit => 5)
  end

  ############################################################################
  #                                                                          #
  #                          Begin Photo Def's                               #
  #                                                                          #
  ############################################################################

  after_save :store_photo
  PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'

  def photo=(file_data)
    unless file_data.blank?
      @file_data = file_data     
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end
  
  def photo_filename
    File.join PHOTO_STORE, "#{id}.#{extension}"
  end
  
  def photo_path
    "/photo_store/#{id}.#{extension}"
  end
  
  def has_photo?
    File.exists? photo_filename
  end
  
  private

  def store_photo
    if @file_data
      FileUtils.mkdir_p PHOTO_STORE
      
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      @file_data = nil
    end
  end

end
