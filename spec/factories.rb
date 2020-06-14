FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    date_of_birth { Faker::Date.birthday }
    gender { Faker::Gender.type }
    pass = Faker::Internet.password
    password  { pass }
    password_confirmation { pass }
  end
end