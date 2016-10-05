class Api::V1::Transactions::SearchController < ApplicationController
  def show
    render json: Transaction.find_by(search_params)
  end

  def index
    render json: Transaction.where(search_params)
  end

  def random
    render json: Transaction.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:credit_card_number, :result, :created_at, :updated_at, :credit_card_expiration_date, :invoice_id)
  end
end
