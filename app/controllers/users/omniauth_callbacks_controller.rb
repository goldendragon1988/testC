class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    oauth_sign_in
  end

  def failure
    redirect_to root_path, notice: "Please try signing in again"
  end

  private

  def oauth_sign_in
    user = User.find_for_oauth(
      auth_request,
      check_user
    )

    if user.present?
      return show_registration_error if user.errors.any?
      return sign_in_and_redirect(user)
    else
      show_registration_error
    end
  end

  def sign_in_and_redirect(user)
    sign_in user, event: :authentication
    render json: user
  end

  def show_registration_error
    render json: {message: "Bad request"}, status: 400
  end

  def check_user
    User.find_by(email: auth_request.info.email)
  end

  def auth_request
    request.env["omniauth.auth"]
  end
end
