class Api::V1::Items::FindController < ApplicationController
  def show
    find_params.each do |key, value|
      render json: ItemSerializer.new(Item.where("lower(#{key}) like ?", "%#{value}%").first)
    end
  end

  private

  def find_params
    params.permit("name", "description", "unit_price", "merchant_id", "id", "updated_at", "created_at")
  end
end
