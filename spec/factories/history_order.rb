FactoryBot.define do
  factory :history_order do
    post_code        { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    municipalities   { Faker::Address.city }
    street_address   { Faker::Address.street_address }
    building_name    { Faker::Address.street_address }
    telephone_number { Faker::Number.decimal_part(digits: 11) }
    #user_id          { Faker::Number.non_zero_digit }
    #item_id          { Faker::Number.non_zero_digit }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
