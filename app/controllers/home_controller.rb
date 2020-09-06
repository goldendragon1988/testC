class HomeController < ApplicationController

  def test
    binding.pry
  end

  def index
    render json: {status: :ok}
  end

  def ping
    head :ok
  end

end
