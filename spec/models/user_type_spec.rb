require 'rails_helper'

RSpec.describe UserType, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user_type)).to be_valid
      expect(build(:user_type, :admin)).to be_valid
    end
  end

  describe 'Association' do
    context 'belongs_to' do
      it { should belong_to(:user) }
    end
  end

  describe "Validations" do
    context "presence" do
      it { should validate_presence_of :type_name }
    end
  end
end
