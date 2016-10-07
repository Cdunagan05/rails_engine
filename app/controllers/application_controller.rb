class ApplicationController < ActionController::API

  def change_dollars_to_cents(params)
    params[:unit_price] = params[:unit_price].gsub(".", "").to_i if params[:unit_price]
  end
end
