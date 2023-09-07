FactoryBot.define do
  factory :item do
    image            { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'sample_image.jpg'), 'image/jpeg') }
    name             { Faker::Commerce.product_name }
    content          { Faker::Lorem.sentence }
    category_id      { '2' }
    state_id         { '2' }
    shipping_cost_id { '2' }
    prefecture_id    { '2' }
    days_to_ship_id  { '2' }
    price            { '300' }

    association :user
  end
end
