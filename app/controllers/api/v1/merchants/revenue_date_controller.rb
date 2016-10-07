class Api::V1::Merchants::RevenueDateController < ApplicationController
  def show
    @total_revenue = Merchant.joins(invoices: [:transactions, :invoice_items]).where(invoices: {created_at: params[:date]}).where(transactions: { result: "success"}).sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
