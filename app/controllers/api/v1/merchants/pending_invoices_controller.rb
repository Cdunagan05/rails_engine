class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def index
    @merchant_customers = Merchant.pending_invoices(params)
  end
end
