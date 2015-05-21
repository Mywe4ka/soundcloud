class Song < ActiveRecord::Base
  attr_accessible :artist, :title, :year

  belongs_to :user
end
