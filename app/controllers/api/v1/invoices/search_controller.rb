class Api::V1::Invoices::SearchController < ApplicationController
  def index
    @invoices = Invoice.where(search_params)
  end

  def show
    @invoice = Invoice.find_by(search_params)
  end

  def random
    @invoice = Invoice.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
