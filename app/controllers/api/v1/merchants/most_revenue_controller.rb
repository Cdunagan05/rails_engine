class Api::V1::Merchants::MostRevenueController < ApplicationController
  def show
    render json: Merchant.select('id', 'name', 'sum(invoice_items.quantity * invoice_items.unit_price) AS total').joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).group('id').order('total DESC').limit(params[:quantity])
  end
end
