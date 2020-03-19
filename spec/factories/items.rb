FactoryBot.define do
  factory :item do
    name { "Banana Stand" }
    description { "A stand for bananas" }
    unit_price { 2.50 }
    merchant
  end
end
