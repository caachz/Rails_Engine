class Api::V1::Merchants::FindController < ApplicationController
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

    merchant = Merchant.where(injection, values).first
    render json: MerchantSerializer.new(merchant)
  end

  private

  def find_params
    params.permit("name", "id", "updated_at", "created_at")
  end
end
