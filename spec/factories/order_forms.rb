FactoryBot.define do
  factory :order_form do
    Faker::Config.locale = :ja
    postal_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    ship_from_to_id        {Faker::Number.between(from: 2, to:48)}
    city_town_village      {Faker::Address.city}
    street_address         {Faker::Address.street_address}
    building_name          {Faker::Company.name}
    phone_number           {Faker::Number.leading_zero_number(digits: 11)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
