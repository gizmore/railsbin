require 'recaptcha_helper.rb'

class SessionsController < Devise::SessionsController
  include RecaptchaHelper

  prepend_before_action only: :create do
    check_recaptcha('login')
  end
end
