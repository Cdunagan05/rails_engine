require 'rails_helper'

RSpec.describe "Invoice search" do
  it "finds one invoice by id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(invoice.id)
  end

  it "finds one invoice by customer id" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer_id: customer1.id)
    invoice2 = create(:invoice, customer_id: customer2.id)

    get "/api/v1/invoices/find?customer_id=#{customer2.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(invoice2.id)
  end

  it "finds one invoice by merchant id" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)

    get "/api/v1/invoices/find?merchant_id=#{merchant2.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(invoice2.id)
  end

  it "finds one invoice by status" do
    invoice1 = create(:invoice, status: "pending")
    invoice2 = create(:invoice, status: "shipped")

    get "/api/v1/invoices/find?status=shipped"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice2.id)
  end

  it "finds one invoice by created at" do
    invoice1 = create(:invoice, created_at: "2016-11-20 12:12:12")
    invoice2 = create(:invoice, created_at: "2016-10-05 12:12:12")

    get "/api/v1/invoices/find?created_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice2.id)
  end

  it "finds one invoice by updated at" do
    invoice1 = create(:invoice, updated_at: "2016-11-20 12:12:12")
    invoice2 = create(:invoice, updated_at: "2016-10-05 12:12:12")

    get "/api/v1/invoices/find?updated_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice2.id)
  end

  it "finds one invoice by id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(invoice.id)
  end

  it "finds all invoices by customer id" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer_id: customer1.id)
    invoice2 = create(:invoice, customer_id: customer2.id)
    invoice3 = create(:invoice, customer_id: customer1.id)

    get "/api/v1/invoices/find_all?customer_id=#{customer1.id}"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice1.id, invoice3.id])
  end

  it "finds all invoices by merchant id" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    invoice3 = create(:invoice, merchant_id: merchant1.id)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant1.id}"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice1.id, invoice3.id])
  end

  it "finds all invoices by status" do
    invoice1 = create(:invoice, status: "pending")
    invoice2 = create(:invoice, status: "shipped")
    invoice3 = create(:invoice, status: "shipped")

    get "/api/v1/invoices/find_all?status=shipped"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice2.id, invoice3.id])
  end

  it "finds all invoices by created at" do
    invoice1 = create(:invoice, created_at: "2016-10-05 12:12:12")
    invoice2 = create(:invoice, created_at: "2016-11-20 12:12:12")
    invoice3 = create(:invoice, created_at: "2016-10-05 12:12:12")

    get "/api/v1/invoices/find_all?created_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice1.id, invoice3.id])
  end

  it "finds all invoices by updated at" do
    invoice1 = create(:invoice, updated_at: "2016-11-20 12:12:12")
    invoice2 = create(:invoice, updated_at: "2016-10-05 12:12:12")
    invoice3 = create(:invoice, updated_at: "2016-10-05 12:12:12")


    get "/api/v1/invoices/find_all?updated_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice2.id, invoice3.id])
  end

  it "finds a random invoice" do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)

    get "/api/v1/invoices/random"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect([invoice1.id, invoice2.id, invoice3.id]).to include parsed_body["id"]
  end
end
