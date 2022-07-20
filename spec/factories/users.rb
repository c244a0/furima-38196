FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { 'tester123' }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { 'ひろし' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'ヒロシ' }
    birthday              { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
