require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "Adding an artist to a song" do
      song = Song.find_by_name("Dark Fantasy")
      artist = Artist.find_by_name("Kanye West")
      song.artist = artist

      assert song.artist.name == 'Kanye West'
  end


  test "Test song limit" do
      s = Song.find_by_name("Sixteen Saltines")
      s.length = 15

      assert ! s.save, "Song length is too long!"

      s.length = 0
      assert ! s.save, "Song is too short!"

      s.length = 5
      assert s.save
  end


end
