require 'rails_helper'

describe "Transactions CRUD API" do
  it "returns a list of transactions" do
    create :transaction
    create :transaction

    get "/api/v1/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
  end

  it "returns a specific transaction" do
    transaction = create :transaction, credit_card_number: "543632"

    get "/api/v1/transactions/#{transaction.id}"

    transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transaction["credit_card_number"]).to eq("543632")

  end

  it "finds an object based on parameters" do
    create :transaction, credit_card_number: "543632"
    create :transaction, credit_card_number: "532"

    get "/api/v1/transactions/find?credit_card_number=532"

    transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transaction["credit_card_number"]).to eq("532")
  end

  it "finds all the instances of a parameter" do
    create :transaction, credit_card_number: "543632"
    create :transaction, credit_card_number: "532"
    create :transaction, credit_card_number: "532"

    get "/api/v1/transactions/find_all?credit_card_number=532"

    transaction_all = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transaction_all.count).to eq(2)
  end
end
