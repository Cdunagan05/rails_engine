class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: Merchant.select('id', 'name', 'sum(invoice_items.quantity) AS items').joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).group('id').order('items DESC').limit(params[:quantity])
  end
end
