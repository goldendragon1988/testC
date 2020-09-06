require 'rails_helper'

RSpec.describe 'Home API', type: :request do
  describe 'GET /' do
    before { get '/' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /' do
    before { get '/ping' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end
