require 'rails_helper'

RSpec.describe "WorkEvents", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/work_events"
      expect(response).to have_http_status(:success)
    end
  end
end