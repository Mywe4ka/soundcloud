class Song < ActiveRecord::Base
  require "id3tag"

  after_commit :set_song_attr_from_id3tag, :on => :create

  attr_accessible :artist, :title, :year, :mfile, :album, :track_nr, :genre, :user_id

  belongs_to :user

  has_attached_file :mfile

  validates_attachment :mfile,
    :presence => true,
    :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] },
    :file_name => { :matches => [/mp3\Z/] },
    :size => { :in => 0..10.megabytes }

  def set_song_attr_from_id3tag
    song = File.open("#{Rails.root}/public" + self.mfile.url)
    ID3Tag.read(song) do |tag|
      self.artist ||= tag.artist
      self.title ||= tag.title
      self.album ||= tag.album
      self.year ||= tag.year
      self.track_nr ||= tag.track_nr
      self.genre ||= tag.genre
      # self.save
    end
  end

end
