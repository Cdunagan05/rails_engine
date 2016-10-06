require 'rails_helper'

RSpec.describe "Transactions relationships" do
  it "returns the associated invoice" do
    invoice1 = create :invoice
    transaction1 = create :transaction, invoice: invoice1

    get "/api/v1/transactions/#{transaction1.id}/invoice"

    transaction_invoice = JSON.parse(response.body)

    expect(transaction_invoice["id"]).to eq(Invoice.last.id)
  end
end
