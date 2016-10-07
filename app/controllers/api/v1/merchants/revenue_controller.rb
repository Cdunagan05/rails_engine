class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    @revenue = Merchant.merchant_revenue(params)
  end
end
