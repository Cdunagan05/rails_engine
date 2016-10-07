class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    render json: Merchant.joins(:invoices, :transactions).where(invoices: {customer_id: params[:customer_id]}, transactions: {result: 'success'}).group('id').order('count(transactions) DESC').first
  end
end
