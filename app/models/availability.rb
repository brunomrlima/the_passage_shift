class Availability < ApplicationRecord
  belongs_to :user
  validates :day, presence: true
  validates :hours, presence: true

  def self.delete_batch(user, updating_days)
    user.availabilities.where.not(day: updating_days).destroy_all
  end
end
