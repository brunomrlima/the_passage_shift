class UserType < ApplicationRecord
  REGULAR = 'regular'
  ADMIN = 'admin'
  belongs_to :user
  validates :type_name, presence: true
end
