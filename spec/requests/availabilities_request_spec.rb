require 'rails_helper'

RSpec.describe "Availabilities", type: :request do
  before(:context) do
    user = create(:user)
    user.confirm
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get "/availabilities"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/availabilities/new"
      expect(response).to have_http_status(302)
    end
  end
end
