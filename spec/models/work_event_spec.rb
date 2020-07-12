require 'rails_helper'

RSpec.describe WorkEvent, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:work_event)).to be_valid
    end
  end
end
