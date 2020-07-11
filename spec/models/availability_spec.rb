require 'rails_helper'

RSpec.describe Availability, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:availability)).to be_valid
    end
  end

  describe 'Association' do
    context 'belongs_to' do
      it { should belong_to(:user) }
    end
  end

  describe "Validations" do
    before { @user = create(:user) }

    context "presence" do
      it { should validate_presence_of :day }
      it { should validate_presence_of :hours }
    end
  end

  describe "Methods" do
    context "#delete_batch" do
      it "expect to delete all days" do
        user = create(:user)
        create(:availability, user: user, day: "Monday")
        create(:availability, user: user, day: "Tuesday")
        create(:availability, user: user, day: "Saturday")
        updating_days = ["Monday", "Wednesday", "Thursday"]
        expect { Availability.delete_batch(user, updating_days) }.to change { user.availabilities.count }.by(-2)
      end
    end
  end
end
