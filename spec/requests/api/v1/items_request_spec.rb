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

  it "Update: sends an updated item" do
    create_list(:item, 3)

    patch "/api/v1/items/#{Item.first.id}", params: {"id": "#{Item.first.id}", "name": "Snow Shoe"}

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["data"]["attributes"]["name"]).to eq("Snow Shoe")
    expect(Item.first.name).to eq("Snow Shoe")
    expect(Item.last.name).to_not eq("Snow Shoe")
  end

  it "Destroy: deletes a item" do
    create_list(:item, 3)

    item_id = Item.first.id

    delete "/api/v1/items/#{item_id}", params: {"name": "Banana Stand", "description": "A stand for bananas", "unit_price": "2.50"}

    expect(response).to be_successful

     item = JSON.parse(response.body)

    expect(item["data"]["id"]).to eq("#{item_id}")
    expect(Item.count).to eq(2)
  end

  it "returns the items associated with an merchant" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant2.id)
    create(:item, merchant_id: merchant2.id)

    get "/api/v1/merchants/#{Merchant.first.id}/items"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    # expect(merchant["data"]["id"].to_i).to eq(merchant1.id)
  end
end
