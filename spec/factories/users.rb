FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {japanese_user.last.kanji}
    first_name            {japanese_user.first.kanji}
    last_name_kana        {japanese_user.last.katakana}
    first_name_kana       { japanese_user.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end