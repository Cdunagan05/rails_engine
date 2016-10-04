require 'rails_helper'

describe "Customers CRUD API" do
  it "returns a list of customers" do
    Customer.create
    Customer.create
    Customer.create

    get "/api/v1/customers"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(3)
  end

  it "returns a specific customer" do
    customer = Customer.create(first_name: "Chase", last_name: "Dunagan")

    get "/api/v1/customers/#{customer.id}"

    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer["first_name"]).to eq("Chase")
  end
end
