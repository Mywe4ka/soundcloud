OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1566575010282707', '178b6444d6ebbed24c0375664db1c57e'
end