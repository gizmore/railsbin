require 'recaptcha_helper.rb'

class PasswordsController < Devise::PasswordsController
  include RecaptchaHelper

  prepend_before_action only: :create do
    check_recaptcha('password_reset')
  end
end
