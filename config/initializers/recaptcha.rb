Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.recaptcha_v3.site_key
  config.secret_key = Rails.application.credentials.recaptcha_v3.secret_key
end
