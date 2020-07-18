class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :work_event
  validates :user_id, uniqueness: { scope: :work_event_id }
end
