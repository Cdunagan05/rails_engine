class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    search_param = params.keys.first.to_sym
    render json: InvoiceItem.where(search_param => params[search_param])
  end

  def show
    search_param = params.keys.first.to_sym
    render json: InvoiceItem.find_by(search_param => params[search_param])
  end

  def random
    render json: InvoiceItem.order("RANDOM()").first
  end
end
