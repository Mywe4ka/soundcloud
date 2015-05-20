class Song < ActiveRecord::Base
  attr_accessible :artist, :title, :year

  has_and_belongs_to_many :users
end
