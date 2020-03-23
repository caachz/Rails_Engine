require 'rails_helper'

describe "Merchants API" do
  it "Index: sends a list of all merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(3)
  end

  it "Show: sends a specific merchant" do
    create_list(:merchant, 3)

    get "/api/v1/merchants/#{Merchant.all.first.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["id"].to_i).to eq(Merchant.all.first.id)
  end

  it "Create: sends a newly created merchant" do
    create_list(:merchant, 3)

    post '/api/v1/merchants', params: {"name": "Grape Stand"}

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(Merchant.all.length).to eq(4)
    expect(merchant["data"]["attributes"]["name"]).to eq("Grape Stand")
  end

  it "Update: sends an updated merchant" do
    create_list(:merchant, 3)

    patch "/api/v1/merchants/#{Merchant.first.id}", params: {"id": "Merchant.first.id", "name": "Snow Store"}

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["attributes"]["name"]).to eq("Snow Store")
    expect(Merchant.last.name).to_not eq("Snow Store")
  end

  it "Destroy: deletes a merchant" do
    create_list(:merchant, 3)

    merchant_id = Merchant.first.id

    delete "/api/v1/merchants/#{merchant_id}", params: {"name": "Banana Stand"}

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["id"]).to eq("#{merchant_id}")
    expect(Merchant.count).to eq(2)
  end

  it "returns the merchant associated with an item" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant2.id)
    create(:item, merchant_id: merchant2.id)

    get "/api/v1/items/#{Item.first.id}/merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["id"].to_i).to eq(merchant1.id)
  end

  it "finds a merchant based on a single search criteria" do
    create_list(:merchant, 3)
    merchant1 = Merchant.create!(name: "Ring World")

    get '/api/v1/merchants/find?name=ring'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["id"].to_i).to eq(merchant1.id)
  end

  it "finds only 1 merchant on a single search criteria" do
    create_list(:merchant, 3)
    merchant1 = Merchant.create!(name: "Ring World")
    merchant2 = Merchant.create!(name: "Turing")

    get '/api/v1/merchants/find?name=ring'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["id"].to_i).to eq(merchant1.id)
  end

  it "returns the multi-finder" do
    create_list(:merchant, 3)
    merchant1 = Merchant.create!(name: "Ring World")
    merchant2 = Merchant.create!(name: "Turing")

    get '/api/v1/merchants/find_all?name=ring'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"].length).to eq(2)
    expect(merchant["data"][0]["id"].to_i).to eq(merchant1.id).or eq(merchant2.id)
    expect(merchant["data"][1]["id"].to_i).to eq(merchant1.id).or eq(merchant2.id)
  end

  it "returns the merchants with the most revenue" do
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

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"].count).to eq(2)
    expect(merchant["data"][0]["attributes"]["name"]).to eq("Ring World")
    expect(merchant["data"][1]["attributes"]["name"]).to eq("Turing")
  end

  it "returns the merchants with the most items sold" do
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

    get '/api/v1/merchants/most_items?quantity=2'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"].count).to eq(2)
    expect(merchant["data"][0]["attributes"]["name"]).to eq("Ring World")
    expect(merchant["data"][1]["attributes"]["name"]).to eq("Turing")
  end
end
