require 'test_helper'

class SongTest < ActiveSupport::TestCase
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
