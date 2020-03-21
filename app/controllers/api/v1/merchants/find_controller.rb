class Api::V1::Merchants::FindController < ApplicationController
  def show
    find_params.each do |key, value|
      render json: MerchantSerializer.new(Merchant.where("lower(#{key}) like ?", "%#{value}%").first)
    end
  end

  private

  def find_params
    params.permit("name".downcase, "id", "updated_at", "created_at")
  end
end
