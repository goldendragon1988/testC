# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def show
    respond_with(current_user)
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :ok
  end
end
