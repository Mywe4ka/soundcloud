class AddAlbumTrackGenreToSong < ActiveRecord::Migration
  def change
    add_column :songs, :album, :string
    add_column :songs, :track_nr, :integer
    add_column :songs, :genre, :string
  end
end
