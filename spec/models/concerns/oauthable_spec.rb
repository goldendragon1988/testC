require 'rails_helper'

RSpec.describe Oauthable do
  let!(:auth) {
    {
      "provider"=>"google_oauth2",
      "uid"=>"117935050446553310905",
      "info"=>
      {"first_name"=>"Jim Arnold",
       "email"=>"jag.arnold.go@gmail.com",
       "last_name"=>"Go"},
       "credentials"=> {"token"=>"def"}
    }.to_dot
  }

  describe "#find_for_oauth" do
    it "creates the user and the provider" do
      expect {
        User.find_for_oauth(auth)
      }.to change(Provider, :count).by(1)
        .and change(User, :count).by(1)
    end
  end
end
