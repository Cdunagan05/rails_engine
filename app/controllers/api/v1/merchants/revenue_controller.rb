class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    merchant = Merchant.find(params[:merchant_id])
    successful_transactions = merchant.invoices.joins([:transactions, :invoice_items]).where(transactions: { result: 'success' })
    if params[:date]
      @revenue = successful_transactions.where(invoices: {created_at: params[:date]}).sum("invoice_items.quantity * invoice_items.unit_price")
    else
      @revenue = successful_transactions.sum("invoice_items.quantity * invoice_items.unit_price")
    end
  end
end
