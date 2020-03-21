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
    
  end
end
