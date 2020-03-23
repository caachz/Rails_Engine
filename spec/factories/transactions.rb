require 'faker'

FactoryBot.define do
  factory :transaction do
    credit_card_number { 1111111111111111 }
    credit_card_expiration_date { Faker::Date.forward(days: 23) }
    invoice
  end
end
