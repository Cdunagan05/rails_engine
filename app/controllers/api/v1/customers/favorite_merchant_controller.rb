class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    @revenue = Merchant.favorite_merchant(params)
  end
end
