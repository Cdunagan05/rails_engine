class Api::V1::Merchants::SearchController < ApplicationController

  def show
    if params.keys.first == "name"
      render json: Merchant.find_by('lower(name) = ?',  params[:name].downcase)
    elsif params.keys.first == "id"
      render json: Merchant.find(params[:id])
    else
      render json: {:errors => Merchant.errors.full_messages}
    end
  end

  def index
    if params.keys.first == "name"
      render json: Merchant.where('lower(name) = ?', params[:name].downcase)
    elsif params.keys.first == "id"
      render json: Merchant.find(params[:id])
    else
      render json: {:errors => Merchant.errors.full_messages}
    end
  end

  def random
    render json: Merchant.order("RANDOM()").first
  end

end
