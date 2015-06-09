class Playlist < ActiveRecord::Base
  attr_accessible :name, :description, :user_id

  belongs_to :user
  has_and_belongs_to_many :songs
end
