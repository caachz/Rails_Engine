require 'rails_helper'

describe "Items API" do
  it "sends a list of all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(3)
  end

  it "Show: sends a specific item" do
    create_list(:item, 3)

    get "/api/v1/items/#{Item.all.first.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["data"]["id"].to_i).to eq(Item.all.first.id)
  end

  it "Create: sends a newly created item" do
    create_list(:item, 3)
    create(:merchant)

    post '/api/v1/items', params: {"name": "apple", "description": "Juicy", "unit_price": "2.40", "merchant_id": "#{Merchant.first.id}"}

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(Merchant.all.length).to eq(4)
  end
end
