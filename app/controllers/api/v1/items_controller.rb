class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params))
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    render json: MerchantSerializer.new(item)
  end

  private
  def item_params
    params.permit("name", "description", "unit_price", "merchant_id", "id")
  end
end
