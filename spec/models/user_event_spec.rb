require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user_event)).to be_valid
    end
  end
end
