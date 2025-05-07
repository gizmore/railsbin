require 'recaptcha_helper.rb'

class ConfirmationsController < Devise::ConfirmationsController
  include RecaptchaHelper

  prepend_before_action only: :create do
    check_recaptcha('password_reset')
  end
end
