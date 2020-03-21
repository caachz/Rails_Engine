class Api::V1::Merchants::SearchController < ApplicationController
  def show
    merchant = Merchant.find(Item.find(params[:item_id]).merchant_id)
    render json: MerchantSerializer.new(merchant)
  end
end
