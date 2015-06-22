class User < ActiveRecord::Base
  include AASM

  attr_accessible :provider, :uid, :name, :first_name, :last_name, :oauth_token,
                  :oauth_expires_at, :city, :country, :description, :photo

  has_many :songs
  has_many :playlists, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :photo,
                    styles: {
                    thumb: '150x150>',
                    medium: '300x300>'
                    }

  validates_attachment_content_type :photo,
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  aasm do
    state :greenman, initial: true
    state :guruman
    state :meloman

    event :guru do
      transitions :from => :greenman, :to => :guruman
    end
    event :melo do
      transitions :from => :guruman, :to => :meloman
    end
    event :green do
      transitions :from => [:guruman, :greenman], :to => :greenman
    end
  end

  def user_status
    quantity = followers.count
    if quantity.between?(20, 49)
      guru!
    elsif quantity >= 50
      melo!
    else
      green!
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.photo = process_uri(auth.info.image)
      user.save!
    end
  end

  def following?(other_user)
    relationships.where(followed_id: other_user.id).first
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.where(followed_id: other_user.id).first.destroy
  end

private

  def self.process_uri(uri)
    return if uri.blank?
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s
  end
end
