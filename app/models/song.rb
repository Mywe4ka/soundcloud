class Song < ActiveRecord::Base
  attr_accessible :artist, :tittle, :year

  has_and_belongs_to_many :users
end
