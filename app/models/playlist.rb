class Playlist < ActiveRecord::Base
  # attr_accessible :name, :description, :user

  belongs_to :user
  has_and_belongs_to_many :songs

  validates :name, presence: true
end
