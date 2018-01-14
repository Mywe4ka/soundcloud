class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.references :user, foreign_key: true, type: :integer
      t.string :title
      t.string :artist
      t.datetime :year

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :songs
  end
end
