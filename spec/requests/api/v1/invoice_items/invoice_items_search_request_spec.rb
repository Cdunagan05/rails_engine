require 'rails_helper'

RSpec.describe "Invoice items search" do
  it "finds one invoice item by id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(invoice_item.id)
  end

  it "finds one invoice item by quantity" do
    invoice_item = create(:invoice_item, quantity: 99)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["quantity"]).to eq(invoice_item.quantity)
  end

  it "finds one invoice item by unit price" do
    invoice_item = create(:invoice_item, unit_price: 1.99)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["unit_price"]).to eq(invoice_item.unit_price)
  end

  it "finds one invoice item by invoice id" do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice2.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice_item2.id)
  end

  it "finds one invoice item by item id" do
    item1 = create(:item)
    item2 = create(:item)
    invoice_item1 = create(:invoice_item, item_id: item1.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id)

    get "/api/v1/invoice_items/find?item_id=#{item2.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice_item2.id)
  end

  it "finds one invoice item by created at" do
    invoice_item1 = create(:invoice_item, created_at: "2016-10-05 12:12:12")
    invoice_item2 = create(:invoice_item, created_at: "2016-11-20 12:12:12")

    get "/api/v1/invoice_items/find?created_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice_item1.id)
  end

  it "finds one invoice item by updated at" do
    invoice_item1 = create(:invoice_item, updated_at: "2016-11-20 12:12:12")
    invoice_item2 = create(:invoice_item, updated_at: "2016-10-05 12:12:12")

    get "/api/v1/invoice_items/find?updated_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(invoice_item2.id)
  end

  it "finds all invoice items by quantity" do
    invoice_item1 = create(:invoice_item, quantity: 99)
    invoice_item2 = create(:invoice_item, quantity: 99)
    invoice_item3 = create(:invoice_item, quantity: 10)

    get "/api/v1/invoice_items/find_all?quantity=99"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice_item1.id, invoice_item2.id])
  end

  it "finds all invoice items by unit price" do
    invoice_item1 = create(:invoice_item, unit_price: 2.99)
    invoice_item2 = create(:invoice_item, unit_price: 1.99)
    invoice_item3 = create(:invoice_item, unit_price: 1.99)

    get "/api/v1/invoice_items/find_all?unit_price=1.99"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice_item2.id, invoice_item3.id])
  end

  it "finds all invoice items by invoice id" do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice1.id)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice1.id}"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice_item1.id, invoice_item3.id])
  end

  it "finds all invoices item by item id" do
    item1 = create(:item)
    item2 = create(:item)
    invoice_item1 = create(:invoice_item, item_id: item1.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id)
    invoice_item3 = create(:invoice_item, item_id: item1.id)

    get "/api/v1/invoice_items/find_all?item_id=#{item1.id}"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice_item1.id, invoice_item3.id])
  end

  it "finds all invoice items by created at" do
    invoice_item1 = create(:invoice_item, created_at: "2016-10-05 12:12:12")
    invoice_item2 = create(:invoice_item, created_at: "2016-11-20 12:12:12")
    invoice_item3 = create(:invoice_item, created_at: "2016-10-05 12:12:12")


    get "/api/v1/invoice_items/find_all?created_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice_item1.id, invoice_item3.id])
  end

  it "finds all invoice itms by updated at" do
    invoice_item1 = create(:invoice_item, updated_at: "2016-11-20 12:12:12")
    invoice_item2 = create(:invoice_item, updated_at: "2016-10-05 12:12:12")
    invoice_item3 = create(:invoice_item, updated_at: "2016-10-05 12:12:12")


    get "/api/v1/invoice_items/find_all?updated_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([invoice_item2.id, invoice_item3.id])
  end

  it "finds a random invoice item" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_item3 = create(:invoice_item)

    get "/api/v1/invoice_items/random"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect([invoice_item1.id, invoice_item2.id, invoice_item3.id]).to include parsed_body["id"]
  end
end
