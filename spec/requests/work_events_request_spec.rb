require 'rails_helper'

RSpec.describe "WorkEvents", type: :request do
  describe "GET /index" do
    before(:context) do
      admin = FactoryBot.create(:admin_user)
      admin.confirm
      sign_in admin
    end

    it "returns http success" do
      get "/work_events"
      expect(response).to have_http_status(:success)
    end
  end
end
