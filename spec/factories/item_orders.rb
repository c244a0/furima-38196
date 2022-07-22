FactoryBot.define do
  factory :item_order do
    postcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    block { 'chiba' }
    building { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    order_id { Faker::Number.non_zero_digit }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
