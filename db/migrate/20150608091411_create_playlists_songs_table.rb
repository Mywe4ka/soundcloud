class CreatePlaylistsSongsTable < ActiveRecord::Migration
  def self.up
    create_table :playlists_songs, id: false do |t|
      t.references :playlist, index: true
      t.references :song, index: true
    end
  end

  def self.down
    drop_table :playlists_songs
  end
end
