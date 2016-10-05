require 'rails_helper'

describe "Merchants CRUD API" do
  it "returns a list of merchants" do
    Merchant.create(name: "Chase")
    Merchant.create(name: "Matt")

    get "/api/v1/merchants.json"

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

  it "finds an object based on parameters" do
    merchant1 = Merchant.create(name: "Chase")
    merchant2 = Merchant.create(name: "Matt")

    get "/api/v1/merchants/find?name=matt"


    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant["name"]).to eq("Matt")
  end

  it "finds an object based on id parameter" do
    merchant1 = Merchant.create(name: "Chase")
    merchant2 = Merchant.create(name: "Matt")

    get "/api/v1/merchants/find?id=#{merchant1.id}"

    merchant_other = JSON.parse(response.body)

    expect(merchant_other["name"]).to eq("Chase")

  end

  it "finds all the instances of a parameter" do
    Merchant.create(name: "Chase")
    Merchant.create(name: "Matt")
    Merchant.create(name: "Chase")

    get "/api/v1/merchants/find_all?name=chase"

    merchant_all = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant_all.count).to eq(2)
  end

  it "finds a random object" do
    Merchant.create(name: "Chase")
    Merchant.create(name: "Matt")
    Merchant.create(name: "Dan")

    get "/api/v1/merchants/random"

    random_merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
  end
end
