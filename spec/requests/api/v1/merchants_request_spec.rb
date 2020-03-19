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
end
