class Api::V1::Merchants::SearchController < ApplicationController

  def show
    @merchant = Merchant.find_by(search_params)
  end

  def index
    @merchants = Merchant.where(search_params)
  end

  def random
    @merchant = Merchant.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
