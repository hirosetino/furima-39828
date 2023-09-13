FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.unique.first_name }
    email                 { Faker::Internet.email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { 'テスト' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birth_date            { '2023-09-06' }
  end
end
