class Availability < ApplicationRecord
  belongs_to :user
  validates :day, presence: true
  validates :hours, presence: true
end
