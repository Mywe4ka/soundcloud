class AddAttachmentMfileToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :mfile
    end
  end

  def self.down
    remove_attachment :songs, :mfile
  end
end
