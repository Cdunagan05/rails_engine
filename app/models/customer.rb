class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_customer(params)
    joins(:invoices, :transactions).
    where(invoices: {merchant_id: params[:merchant_id]}, transactions: {result: 'success'}).
    group('id').order('count(transactions) DESC').first
  end
end
