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
      it { should have_many(:user_events) }
      it { should have_many(:work_events) }
      it 'dependent destroy: should destroy availabilities if destroyed' do
        user = create(:user_with_availabilities)
        expect { user.destroy }.to change { Availability.count }.by(-user.availabilities.count)
      end
      it 'dependent destroy: should destroy user types if destroyed' do
        user = create(:admin_user)
        expect { user.destroy }.to change { UserType.count }.by(-user.user_types.count)
      end
      it 'dependent destroy: should destroy user types if destroyed' do
        user = create(:user_with_user_events)
        expect { user.destroy }.to change { UserEvent.count }.by(-user.user_events.count)
      end
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
      it "should return false" do
        user = create(:user)
        expect(user.admin?).to eq(false)
      end

      it "should return true" do
        user = create(:user)
        user.user_types.create(type_name: "admin")
        expect(user.admin?).to eq(true)
      end
    end

    context "#full_name" do
      it "should complete name" do
        user = create(:user)
        expect(user.full_name).to eq(user.first_name + " " + user.last_name)
      end
    end
  end
end
