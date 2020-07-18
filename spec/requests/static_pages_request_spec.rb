require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/static_pages/home"
      user = create(:user)
      user.confirm
      sign_in user
      expect(response).to have_http_status(302)
    end
  end

end
