class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    change_unit_price if params[:unit_price]
    render json: InvoiceItem.where(search_params)
  end

  def show
    change_unit_price if params[:unit_price]
    render json: InvoiceItem.find_by(search_params)
  end

  def random
    render json: InvoiceItem.order("RANDOM()").first
  end

  private

  def change_unit_price
    params[:unit_price] = params[:unit_price].gsub(".", "").to_i
  end

  def search_params
    params.permit(:unit_price, :id, :quantity, :invoice_id, :item_id, :created_at, :updated_at)
  end
end
