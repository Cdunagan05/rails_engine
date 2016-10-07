class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    @customer = Customer.favorite_customer(params)
  end
end
