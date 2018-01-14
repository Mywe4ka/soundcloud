class AddAlbumTrackGenreToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :album, :string
    add_column :songs, :track_nr, :integer
    add_column :songs, :genre, :string
  end

  def self.down
    remove_column :songs, :album, :string
    remove_column :songs, :track_nr, :integer
    remove_column :songs, :genre, :string
  end
end
