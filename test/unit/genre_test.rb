require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "Test ablility to find genre record" do
      g = Genre.find_by_name("Rock")

      assert g.name == "Rock", "Genre name did not match successfully"
  end

  test "Adding a genre to a song" do
      genre = Genre.find_by_name("Rock")

      song = Song.find_by_name("Sixteen Saltines")
      genre.songs << song

      assert genre.songs.length > 0
  end

end
