class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchant(params)
    joins(:invoices, :transactions).
    where(invoices: {customer_id: params[:customer_id]}, transactions: {result: 'success'}).
    group('id').
    order('count(transactions) DESC').first
  end

  def self.most_items(params)
    select('id', 'name', 'sum(invoice_items.quantity) AS items').
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: { result: 'success' }).
    group('id').
    order('items DESC').
    limit(params[:quantity])
  end

  def self.most_revenue(params)
    select('id', 'name', 'sum(invoice_items.quantity * invoice_items.unit_price) AS total').
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: { result: 'success' }).
    group('id').
    order('total DESC').
    limit(params[:quantity])
  end

  def self.pending_invoices(params)
    merchant = find(params[:merchant_id])
    merchant.customers.joins("join transactions on transactions.invoice_id = invoices.id").
    where(transactions: { result: "failed"} ).uniq
  end

  def self.all_merchants_revenue(params)
    joins(invoices: [:transactions, :invoice_items]).
    where(invoices: {created_at: params[:date]}).
    where(transactions: { result: "success"}).
    sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.merchant_revenue(params)
    merchant = find(params[:merchant_id])
    successful_transactions = merchant.invoices.
                              joins([:transactions, :invoice_items]).
                              where(transactions: { result: 'success' })
    if params[:date]
      successful_transactions.
      where(invoices: {created_at: params[:date]}).
      sum("invoice_items.quantity * invoice_items.unit_price")
    else
      successful_transactions.
      sum("invoice_items.quantity * invoice_items.unit_price")
    end
  end
end
