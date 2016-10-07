class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def index
    render json: Merchant.pending_invoices(params)
  end
end
