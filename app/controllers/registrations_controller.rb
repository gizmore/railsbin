require 'recaptcha_helper.rb'

class RegistrationsController < Devise::RegistrationsController
  include RecaptchaHelper

  prepend_before_action only: :create do
    check_recaptcha('signup')
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end
