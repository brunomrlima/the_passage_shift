FactoryBot.define do
  factory :user_type do
    association :user
    type_name { "regular" }

    trait :admin do
      type_name { "admin" }
    end
  end
end
