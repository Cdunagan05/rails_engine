class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.customers.joins("join transactions on transactions.invoice_id = invoices.id").where(transactions: { result: "failed"} ).uniq
  end
end
