FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    detail                {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from: 2, to:11)}
    condition_id          {Faker::Number.between(from: 2, to:7)}
    shipping_charge_id    {Faker::Number.between(from: 2, to:4)}
    ship_from_to_id       {Faker::Number.between(from: 2, to:48)}
    days_to_ship_date_id  {Faker::Number.between(from: 2, to:3)}
    price                 {Faker::Number.between(from: 300, to:9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end
