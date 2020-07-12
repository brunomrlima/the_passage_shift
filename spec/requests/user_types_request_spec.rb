require 'rails_helper'

RSpec.describe "UserTypes", type: :request do
  describe "GET /index" do
    before(:context) do
      admin = FactoryBot.create(:admin_user)
      admin.confirm
      sign_in admin
    end

    it "returns http success" do
      get "/user_types"
      expect(response).to have_http_status(:success)
    end
  end
end
