require 'rails_helper'

describe "Transactions CRUD API" do
  it "returns a list of transactions" do
    Transaction.create
    Transaction.create

    get "/api/v1/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
  end

  it "returns a specific transaction" do
    transaction = Transaction.create(credit_card_number: 543632)

    get "/api/v1/transactions/#{transaction.id}"

    transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transaction["credit_card_number"]).to eq(543632)
  end
end
