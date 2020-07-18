require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user_event)).to be_valid
    end
  end

  describe 'Association' do
    context 'belongs_to' do
      it { should belong_to(:user) }
      it { should belong_to(:work_event) }
    end
  end
end
