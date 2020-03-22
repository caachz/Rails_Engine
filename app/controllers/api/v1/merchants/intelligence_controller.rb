class Api::V1::Merchants::IntelligenceController < ApplicationController
  def index
    merchants = Merchant.joins(:transactions).where(transactions: {result: :success}).limit(params["quantity"].to_i).select('merchants.*, sum(invoice_items.unit_price * invoice_items.quantity') as revenue').group(:id).order('revenue DESC')
    render json: MerchantSerializer.new(merchants)
  end
end
