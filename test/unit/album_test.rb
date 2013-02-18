require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Test ablility to find album record" do
      a = Album.find_by_name("My Beautiful Dark Twisted Fantasy")
      assert a.name == "My Beautiful Dark Twisted Fantasy", "Album name did not match successfully" 
  end

  test "Adding an artist to an album" do
      album = Album.find_by_name("My Beautiful Dark Twisted Fantasy")
      artist = Artist.find_by_name("Kanye West")
      album.artist = artist
      assert album.artist.length > 0
  end

end
