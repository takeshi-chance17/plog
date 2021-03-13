FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Gimei.first.kanji }
    last_name             { Gimei.last.kanji }
    first_name_read       { Gimei.first.katakana }
    last_name_read        { Gimei.last.katakana }
    birth_day             { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
