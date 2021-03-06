class Api::V1::Customers::SearchController < ApplicationController
  def show
    @customer = Customer.find_by(search_params)
  end

  def index
    @customers = Customer.where(search_params)
  end

  def random
    @customer = Customer.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
