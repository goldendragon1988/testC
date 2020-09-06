require 'rails_helper'

RSpec.describe Oauthable do
  let!(:user) { create :user }
  let!(:provider) { create :provider, user_id: user.id }

  let!(:auth) {
    {
      provider: "google_oauth2",
      uid: "117935050446553310905",
			info: {name: "Jim Arnold Go", email: "jag.arnold.go@gmail.com", first_name: "Jim Arnold", last_name: "Go"},
			credentials: {token: "ya29.a0AfH6SMBZubLwlSegNVISeLxxNV9DQognEMrW0YWjdfedf819P9-aqKQY3TfcPIs4NZMXeFjBKXYrRa0TtdK47lmPpuixx2-qDaB8FcWhYXhnfgVc_U-WXoAEIMlPnIajQ6fejWrBm9jA5MJbedlgA2w4aJfszY-wBqI"}
    }
  }

  describe "#find_for_oauth" do
    context "when user is available" do
      context "and provider is available" do
        it "updates the credentails of the provider" do

        end
      end

      context "and provider is unavailable" do
        it "creates the provider" do

        end
      end
    end

    context "when user is unavailable" do
      it "creates the user and the provider" do
				expect {
          User.find_for_oauth(Struct.new(auth))
				}.to change(Provider, :count).by(1)
      end
    end
  end

end

    #{
      #provider: "google_oauth2",
      #uid: "117935050446553310905",
			#info: {name: "Jim Arnold Go", email: "jag.arnold.go@gmail.com", first_name: "Jim Arnold", last_name: "Go"},
			#credentials: {token: "ya29.a0AfH6SMBZubLwlSegNVISeLxxNV9DQognEMrW0YWjdfedf819P9-aqKQY3TfcPIs4NZMXeFjBKXYrRa0TtdK47lmPpuixx2-qDaB8FcWhYXhnfgVc_U-WXoAEIMlPnIajQ6fejWrBm9jA5MJbedlgA2w4aJfszY-wBqI"}
    #}
