class Api::V1::Items::FindController < ApplicationController
  def show
    injection = ""
    values = {}
    find_params.each do |key, value|
      string = " lower(#{key}) like :#{key} OR"
      injection = injection + string
      values[key.to_sym] = "%#{value}%"
    end
    injection.slice!" "
    injection.delete_suffix!(' OR')

    item = Item.where(injection, values).first
    render json: ItemSerializer.new(item)
  end

  private

  def find_params
    params.permit("name", "description", "unit_price", "merchant_id", "id", "updated_at", "created_at")
  end
end
