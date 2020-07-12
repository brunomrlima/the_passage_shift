require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should have_many(:availabilities) }
      it { should have_many(:user_types) }
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

  describe "Methods" do
    context "#create_user_type" do
      it "expect to create user type after creating user" do
        expect { create(:user) }.to change { UserType.count }.by(1)
      end

      it "expect to create user type" do
        user = create(:user)
        user_type = user.create_user_type
        expect(user_type.type_name).to eq("regular")
      end
    end

    context "#admin?" do
      it "sould return false" do
        user = create(:user)
        expect(user.admin?).to eq(false)
      end

      it "sould return true" do
        user = create(:user)
        user.user_types.create(type_name: "admin")
        expect(user.admin?).to eq(true)
      end
    end
  end
end
