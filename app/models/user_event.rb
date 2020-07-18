class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :work_event
end
