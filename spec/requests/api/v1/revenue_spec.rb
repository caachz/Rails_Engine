require 'rails_helper'

describe "revenue API endpoint" do
  it "revenue across date range" do
    merchant1 = Merchant.create!(name: "Ring World")
    merchant2 = Merchant.create!(name: "Turing")

    item1 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant1)
    item2 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant1)
    item3 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant1)
    item4 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant1)
    item5 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant1)
    item6 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant2)
    item7 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant2)
    item8 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant2)
    item9 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant2)
    item10 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant2)
    item11 = Item.create!(name: Faker::Commerce.product_name, description: Faker::Commerce.color, unit_price: Faker::Commerce.price, merchant: merchant2)

    customer1 = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

    invoice1 = Invoice.create!(merchant: merchant1, customer: customer1)
    invoice2 = Invoice.create!(merchant: merchant2, customer: customer1)

    InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 300, unit_price: 50000000.23)
    InvoiceItem.create!(item: item2, invoice: invoice1, quantity: 400, unit_price: 40000000.32)
    InvoiceItem.create!(item: item3, invoice: invoice1, quantity: 500, unit_price: 30000000.32)
    InvoiceItem.create!(item: item4, invoice: invoice1, quantity: 600, unit_price: 20000000.32)
    InvoiceItem.create!(item: item5, invoice: invoice1, quantity: 700, unit_price: 10000000.32)

    InvoiceItem.create!(item: item6, invoice: invoice2, quantity: 1, unit_price: 1.00)
    InvoiceItem.create!(item: item7, invoice: invoice2, quantity: 4, unit_price: 2.00)
    InvoiceItem.create!(item: item8, invoice: invoice2, quantity: 5, unit_price: 3.50)
    InvoiceItem.create!(item: item9, invoice: invoice2, quantity: 6, unit_price: 4.76)
    InvoiceItem.create!(item: item10, invoice: invoice2, quantity: 7, unit_price: 1.29)
    InvoiceItem.create!(item: item11, invoice: invoice2, quantity: 7, unit_price: 2.23)

    Transaction.create!(invoice: invoice1, credit_card_number: 1111111111111111, credit_card_expiration_date: Faker::Date.forward(days: 23))
    Transaction.create!(invoice: invoice2, credit_card_number: 1111111111111111, credit_card_expiration_date: Faker::Date.forward(days: 23))

    get '/api/v1/revenue?start=2020-03-09&end=2020-03-24'

    expect(response).to be_successful

    revenue = JSON.parse(response.body)

    expect(revenue["data"]["attributes"]["revenue"]).to eq(65000000852.7)
  end
end
