class Api::V1::Transactions::SearchController < ApplicationController
  def show
    @transaction = Transaction.find_by(search_params)
  end

  def index
    @transactions = Transaction.where(search_params)
  end

  def random
    @transaction = Transaction.order("RANDOM()").first
  end

  private

  def search_params
    params.permit(:id, :credit_card_number, :result, :created_at, :updated_at, :credit_card_expiration_date, :invoice_id)
  end
end
