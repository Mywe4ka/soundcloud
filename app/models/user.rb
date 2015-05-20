class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :first_name, :last_name, :oauth_token,
                  :oauth_expires_at, :city, :country, :description, :photo

  has_and_belongs_to_many :songs

  has_attached_file :photo,
                    styles: {
                    thumb: '150x150>',
                    medium: '300x300>'
                    }

  validates_attachment_content_type :photo,
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.photo = process_uri(auth.info.image)
      user.save!
    end
  end

private

  def self.process_uri(uri)
    return if uri.blank?
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s
  end
end
