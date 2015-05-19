class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :first_name, :last_name, :oauth_token,
                  :oauth_expires_at, :city, :country, :description, :photo

  has_attached_file :photo,
                    styles: {
                    thumb: '150x150>',
                    medium: '300x300>'
                    },
                    default_url: "user_default.png"

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
      #user.photo = auth.info.image
      user.save!
    end
  end

end
