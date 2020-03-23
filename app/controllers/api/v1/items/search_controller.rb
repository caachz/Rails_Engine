class Api::V1::Items::SearchController < ApplicationController
  def show
    items = Merchant.find(params["merchant_id"]).items
    render json: ItemSerializer.new(items)
  end
end
