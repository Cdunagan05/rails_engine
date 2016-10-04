class Api::V1::Invoices::SearchController < ApplicationController
  def index
    search_param = params.keys.first.to_sym
    render json: Invoices.where(search_param => params[search_param])
  end

  def show
    search_param = params.keys.first.to_sym
    render json: Invoices.find_by(search_param => params[search_param])
  end

  def random
    render json: Invoices.order("RANDOM()").first
  end
end
