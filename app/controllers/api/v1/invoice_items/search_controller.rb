class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    change_dollars_to_cents(params)
    @invoice_items = InvoiceItem.where(search_params)
  end

  def show
    change_dollars_to_cents(params)
    @invoice_item = InvoiceItem.find_by(search_params)
  end

  def random
    @invoice_item = InvoiceItem.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:unit_price, :id, :quantity, :invoice_id, :item_id, :created_at, :updated_at)
  end
end
