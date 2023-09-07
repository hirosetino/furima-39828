FactoryBot.define do
  factory :item do
    name             { Faker::Commerce.product_name }
    content          { Faker::Lorem.sentence }
    category_id      { '2' }
    state_id         { '2' }
    shipping_cost_id { '2' }
    prefecture_id    { '2' }
    days_to_ship_id  { '2' }
    price            { '300' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample_image.jpg'), filename: 'sample_image.jpg')
    end
  end
end
