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

      assert album.artist.name == 'Kanye West'
  end

  test "adding many genres to single album" do
      album = Album.find_by_name("My Beautiful Dark Twisted Fantasy")

      genre = Genre.find_by_name("Rock")
      album.genres << genre

      genre = Genre.find_by_name("Folk Rock")
      album.genres << genre

      assert album.genres.length == 2
  end

end
