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
end
