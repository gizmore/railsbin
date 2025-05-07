module RecaptchaHelper
  def check_recaptcha(action, minimum_score = 0.8)
    return if verify_recaptcha(action: action, minimum_score: minimum_score)
    return if verify_recaptcha(model: @post, secret_key: Rails.application.credentials.recaptcha_v2.secret_key) unless @show_checkbox_recaptcha

    @show_checkbox_recaptcha = true
    self.resource = resource_class.new user_params()

    respond_with_navigational(resource) do
      flash.discard(:recaptcha_error)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

end
