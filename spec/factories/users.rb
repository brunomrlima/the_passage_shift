FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email  { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday }
    phone { Faker::PhoneNumber.cell_phone_in_e164  }
    gender { Faker::Gender.type }
    pass = Faker::Internet.password
    password  { pass }
    password_confirmation { pass }

    factory :user_with_availabilities do
      transient do
        availabilities_count { 7 }
      end
      after(:create) do |user, evaluator|
        create_list(:availability, evaluator.availabilities_count, user: user)
      end
    end

    factory :admin_user do
      transient do
        user_type_count { 1 }
      end
      after(:create) do |user, evaluator|
        create_list(:user_type, evaluator.user_type_count, :admin, user: user)
      end
    end

    factory :user_with_user_events do
      transient do
        user_events_count { 4 }
      end
      after(:create) do |user, evaluator|
        create_list(:user_event, evaluator.user_events_count, user: user)
      end
    end
  end
end