class WorkEvent < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  def self.fetch_work_events_with_not_enough_helpers_today_and_tomorrow
    self.where(start_time: DateTime.now..DateTime.tomorrow.end_of_day).
        order(:start_time).
        left_joins(:user_events).
        group(:id).
        having('COUNT(user_events.id) < work_events.helpers_needed')
  end

  def return_text_color(user)
    helpers = helpers_needed || user_events.count + 1
    if user_events.count >= helpers
      klass = "text-danger"
    end

    if UserEvent.where(user: user, work_event: self).present?
      klass = "text-success"
    end

    klass
  end
end
