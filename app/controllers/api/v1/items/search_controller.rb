class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.find_by(search_params)
  end

  def random
    render json: Item.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:id, :merchant_id, :name, :description, :unit_price, :created_at, :updated_at)
  end
end
