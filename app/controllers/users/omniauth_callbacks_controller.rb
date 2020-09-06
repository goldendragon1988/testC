class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #def facebook
    #oauth_sign_in
  #end

  def google_oauth2
    oauth_sign_in
  end

  def failure
    redirect_to root_path, notice: "Please try signing in again"
  end

  private
  def oauth_sign_in
    binding.pry
    user = User.find_for_oauth(request.env["omniauth.auth"].merge(request.env["omniauth.params"]), check_user)

    if user.present?
      return show_registration_error if user.errors.any?
      return sign_in_and_redirect(user) if user.confirmed?
      return notify_to_confirm(user)
    else
      show_registration_error
    end
  end

  def sign_in_and_redirect(user)
    sign_in user, event: :authentication
    redirect_to authenticated_root_path, notice: "Successfully signed-in using #{provider}"
  end

  def show_registration_error
    session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
    redirect_to root_path, flash: { danger: "Unable to proceed. Please use a different method to login." }
  end

  def notify_to_confirm(user)
    session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
    redirect_to root_path, flash: { danger: "Click on the account confirmation link sent to your inbox before your first log in." }
  end

  def provider
    request.env["omniauth.auth"].provider.titleize
  end

  def check_user
    User.find_by(email: request.env["omniauth.auth"].info.email)
  end
end
