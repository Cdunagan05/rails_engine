class Api::V1::Invoices::MerchantController < ApplicationController
  def show
    @merchant = Invoice.find(params[:invoice_id]).merchant
  end
end
