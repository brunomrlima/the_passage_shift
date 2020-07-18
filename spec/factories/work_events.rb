FactoryBot.define do
  factory :work_event do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph(sentence_count: 4) }
    start_time { DateTime.new(2020,12,13,8,0,0) }
    end_time { DateTime.new(2020,12,13,10,0,0) }
  end
end
