require 'faker'

FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.color }
    unit_price { Faker::Commerce.price }
    merchant
  end
end
