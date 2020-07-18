FactoryBot.define do
  factory :user_event do
    association :user
    association :work_event
  end
end
