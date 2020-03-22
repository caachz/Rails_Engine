class Api::V1::Items::FindController < ApplicationController
  def show
    item = Item.where(injection, values).first
    render json: ItemSerializer.new(item)
  end

  def index
    items = Item.where(injection, values)
    render json: ItemSerializer.new(items)
  end

  private

  def find_params
    params.permit("name", "description", "unit_price", "merchant_id", "id", "updated_at", "created_at")
  end

  def injection
    injection = ""

    find_params.each do |key, value|
      key = key.downcase
      string = " lower(#{key}) like :#{key} OR"
      injection = injection + string
    end

    injection.slice!" "
    injection.delete_suffix!(' OR')
    injection
  end

  def values
    values = {}
    find_params.each do |key, value|
      key = key.downcase
      values[key.to_sym] = "%#{value}%"
    end
    values
  end
end
