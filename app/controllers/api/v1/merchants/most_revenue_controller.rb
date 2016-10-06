class Api::V1::Merchants::MostRevenueController < ApplicationController
  def show
    byebug
    render json: Merchant.joins(:invoices)
    Merchant.select('id', 'name', 'invoice_items.quantity * invoice_items.unit_price AS total').joins(invoices: [:transactions, :invoice_items]).where('transactions.result' => 'success').order('total').limit(10)
  end
end
