class HomeController < ApplicationController

  def index
    render json: {status: :ok}
  end

  def ping
    head :ok
  end

end
