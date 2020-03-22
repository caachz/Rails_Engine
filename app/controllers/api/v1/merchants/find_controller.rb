class Api::V1::Merchants::FindController < ApplicationController
  def show
    merchant = Merchant.where(injection, values).first
    render json: MerchantSerializer.new(merchant)
  end

  def index
    merchants = Merchant.where(injection, values)
    render json: MerchantSerializer.new(merchants)
  end

  private

  def find_params
    params.permit("name", "id", "updated_at", "created_at")
  end

  def injection
    injection = ""

    find_params.each do |key, value|
      key = key.downcase
      value = value.downcase
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
      value = value.downcase
      values[key.to_sym] = "%#{value}%"
    end
    values
  end
end
