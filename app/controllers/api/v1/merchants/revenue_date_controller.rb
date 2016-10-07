class Api::V1::Merchants::RevenueDateController < ApplicationController
  def show
    @total_revenue = Merchant.all_merchants_revenue(params)
  end
end
