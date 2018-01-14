class Song < ActiveRecord::Base
  require "id3tag"

  after_commit :set_song_attr_from_id3tag, :on => :create

  # attr_accessible :artist, :title, :year, :mfile, :album, :track_nr, :genre, :user_id

  belongs_to :user
  has_and_belongs_to_many :playlists
  has_attached_file :mfile

  validates :user, presence: true, :on => :update
  validates_attachment :mfile,
      :presence => true,
      :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] },
      :file_name => { :matches => [/mp3\Z/] },
      :size => { :in => 0..15.megabytes }

  def set_song_attr_from_id3tag
    song = ID3Tag.read(File.open("#{Rails.root}/public" + self.mfile.url))
    self.attributes.each_key do |attr|
      next unless song.respond_to? attr
      self[attr] ||= song.send(attr.to_sym)
    end
  end
end
