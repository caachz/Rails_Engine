require 'faker'

FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.digit }
    unit_price { Faker::Commerce.price }
    item
    invoice
  end
end
