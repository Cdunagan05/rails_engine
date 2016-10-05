class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    render json: InvoiceItem.where(search_params)
  end

  def show
    render json: InvoiceItem.find_by(search_params)
  end

  def random
    render json: InvoiceItem.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:unit_price, :id, :quantity, :invoice_id, :item_id, :created_at, :updated_at)
  end
end
