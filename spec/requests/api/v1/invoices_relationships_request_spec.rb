require 'rails_helper'

RSpec.describe "Invoices relationships" do
  it "returns all associated transactions with an invoice" do
    invoice1 = create :invoice
    transaction1 = create :transaction, invoice: invoice1

    get "/api/v1/invoices/#{invoice1.id}/transactions"

    invoice_transactions = JSON.parse(response.body)

    expect(invoice_transactions.count).to eq(1)
  end

  it "returns all associated invoice_items with an invoice" do
    invoice1 = create :invoice
    invoice_item1 = create :invoice_item, invoice: invoice1

    get "/api/v1/invoices/#{invoice1.id}/invoice_items"

    invoice_invoice_items = JSON.parse(response.body)

    expect(invoice_invoice_items.count).to  eq(1)
  end

  it "returns all associated items with an invoice" do
    invoice1 = create :invoice
    item1 = create :item
    invoice_item1 = create :invoice_item, invoice: invoice1, item: item1

    get "/api/v1/invoices/#{invoice1.id}/items"

    invoices_items = JSON.parse(response.body)

    expect(invoices_items.count).to eq(1)
  end

  it "returns all associated customers with an invoice" do
    customer1 = create :customer
    invoice1 = create :invoice, customer: customer1

    get "/api/v1/invoices/#{invoice1.id}/customer"

    invoices_customers = JSON.parse(response.body)

    expect(invoices_customers["id"]).to eq(Customer.last.id)
  end

  it "returns all associated merchants with an invoice" do
    merchant1 = create :merchant
    invoice1 = create :invoice, merchant: merchant1

    get "/api/v1/invoices/#{invoice1.id}/merchant"

    invoice_merchants = JSON.parse(response.body)

    expect(invoice_merchants["id"]).to eq(Merchant.last.id)
  end
end
