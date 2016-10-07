class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    render json: Customer.joins(:invoices, :transactions).where(invoices: {merchant_id: params[:merchant_id]}, transactions: {result: 'success'}).group('id').order('count(transactions) DESC').first
  end
end
