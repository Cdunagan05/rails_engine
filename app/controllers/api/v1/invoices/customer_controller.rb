class Api::V1::Invoices::CustomerController < ApplicationController
  def show
    @customer = Invoice.find(params[:invoice_id]).customer
  end
end
