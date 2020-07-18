require 'rails_helper'

RSpec.describe WorkEvent, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:work_event)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should have_many(:user_events) }
      it { should have_many(:users) }
    end
  end
end
