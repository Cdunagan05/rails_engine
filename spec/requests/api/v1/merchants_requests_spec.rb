require 'rails_helper'

describe "Merchants CRUD API" do
  it "returns a list of merchants" do
    Merchant.create(name: "Chase")
    Merchant.create(name: "Matt")

    get "/api/v1/merchants"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq(2)
  end

  it "returns a specific merchant" do
    merchant = Merchant.create(name: "Chase")

    get "/api/v1/merchants/#{merchant.id}"

    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant["name"]).to eq("Chase")
  end

  it "finds a "
end
