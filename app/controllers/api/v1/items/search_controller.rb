class Api::V1::Items::SearchController < ApplicationController
  def index
    @items = Item.where(search_params)
  end

  def show
    change_dollars_to_cents(params)
    @item = Item.find_by(search_params)
  end

  def random
    @item = Item.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:id, :merchant_id, :name, :description, :unit_price, :created_at, :updated_at)
  end
end
