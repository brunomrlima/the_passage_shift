class UserType < ApplicationRecord
  belongs_to :user
  validates :type_name, presence: true
end
