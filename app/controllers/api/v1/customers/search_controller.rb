class Api::V1::Customers::SearchController < ApplicationController
  def show
    render json: Customer.find_by(search_params)
  end

  def index
    render json: Customer.where(search_params)
  end

  def random
    render json: Customer.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:first_name, :last_name, :created_at, :updated_at)
  end

end
