class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    render json: Merchant.favorite_merchant(params)
  end
end