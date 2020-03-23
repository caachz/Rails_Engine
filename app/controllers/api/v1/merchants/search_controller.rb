class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if params["item_id"] != nil
      merchant = Merchant.find(Item.find(params[:item_id]).merchant_id)
    else
    end
    render json: MerchantSerializer.new(merchant)
  end

end
