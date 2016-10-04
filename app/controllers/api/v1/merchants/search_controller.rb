class Api::V1::Merchants::SearchController < ApplicationController

  def show
    if params.keys.first == "name"
      render json: Merchant.where('lower(name) = ?',  params[:name].downcase).first
    elsif params.keys.first == "id"
      render json: Merchant.find(params[:id])
    else
      render json: {:errors => Merchant.errors.full_messages}
    end
  end

end
