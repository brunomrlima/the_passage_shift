FactoryBot.define do
  factory :availability do
    association :user
    day { "Monday" }
    hours { "07:00-12:00, 16:00-18:00" }
  end
end
