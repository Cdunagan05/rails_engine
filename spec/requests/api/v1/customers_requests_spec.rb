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

  it "finds an object based on parameters" do
    Customer.create(first_name: "Chase")

    get '/api/v1/customers/find?first_name=chase'

    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer["first_name"]).to eq("Chase")
  end

  it "finds all instance of a parameter" do
    Customer.create(first_name: "Chase")
    Customer.create(first_name: "Matt")
    Customer.create(first_name: "Chase")

    get '/api/v1/customers/find_all?first_name=chase'

    customer_all = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer_all.count).to eq(2)
  end

  it "finds a random object" do
    Customer.create(first_name: "Chase")
    Customer.create(first_name: "Matt")
    Customer.create(first_name: "Dan")

    get "/api/v1/customers/random"

    random_customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
  end
end
