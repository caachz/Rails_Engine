require 'date'

class Api::V1::RevenueController < ApplicationController
  def show
    start = params["start"].to_datetime
    finish = params["end"].to_datetime
    revenue = Invoice.joins(:invoice_items).where(created_at: start..finish).pluck('sum(invoice_items.quantity * invoice_items.unit_price)').first
    json_hash = {"data": {"id": "null","attributes": {"revenue": revenue}}}
    render json: json_hash
  end
end
