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
end
