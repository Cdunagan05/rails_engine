class Api::V1::Items::SearchController < ApplicationController
  def index
    @items = Item.where(search_params)
  end

  def show
    change_unit_price if params[:unit_price]
    @item = Item.find_by(search_params)
  end

  def random
    @item = Item.order("RANDOM()").first
  end

  private

  def change_unit_price
    params[:unit_price] = params[:unit_price].gsub(".", "").to_i
  end

  def search_params
    params.permit(:id, :merchant_id, :name, :description, :unit_price, :created_at, :updated_at)
  end
end
