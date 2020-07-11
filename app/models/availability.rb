class Availability < ApplicationRecord
  belongs_to :user
  validates :day, presence: true
  validates :hours, presence: true

  def self.delete_batch(user, reject_days)
    user.availabilities.where.not(day: reject_days).destroy_all
  end
end
