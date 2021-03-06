class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :playlists
  end
end