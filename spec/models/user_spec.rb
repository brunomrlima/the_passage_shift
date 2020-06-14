require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  context "validations" do
    before { @user = create(:user) }

    context "presence" do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :gender }
      it { should validate_presence_of :date_of_birth }
    end

    context "password" do
      it 'is database authenticable' do
        expect(@user.valid_password?(@user.password)).to be_truthy
      end
    end
  end
end
