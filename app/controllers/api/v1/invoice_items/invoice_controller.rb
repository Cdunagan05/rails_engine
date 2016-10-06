class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def show
    @invoice = InvoiceItem.find(params[:invoice_item_id]).invoice
  end
end
