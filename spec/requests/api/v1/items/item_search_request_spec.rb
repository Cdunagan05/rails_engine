require 'rails_helper'

RSpec.describe "Item search" do
  it "finds one item by id" do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(item.id)
  end

  it "finds one item by merchant id" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant2.id)

    get "/api/v1/items/find?merchant_id=#{merchant2.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["id"]).to eq(item2.id)
  end

  it "finds one item by name" do
    item1 = create(:item, name: "Car")
    item2 = create(:item, name: "Bike")

    get "/api/v1/items/find?name=bike"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(item2.id)
  end

  it "finds one item by description" do
    item1 = create(:item, description: "Car")
    item2 = create(:item, description: "Bike")

    get "/api/v1/items/find?description=bike"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(item2.id)
  end

  it "finds one item by unit_price" do
    item1 = create(:item, unit_price: 199)
    item2 = create(:item, unit_price: 299)

    get "/api/v1/items/find?unit_price=299"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(item2.id)
  end

  it "finds one item by created at" do
    item1 = create(:item, created_at: "2016-11-20 12:12:12")
    item2 = create(:item, created_at: "2016-10-05 12:12:12")

    get "/api/v1/items/find?created_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(item2.id)
  end

  it "finds one item by updated at" do
    item1 = create(:item, updated_at: "2016-11-20 12:12:12")
    item2 = create(:item, updated_at: "2016-10-05 12:12:12")

    get "/api/v1/items/find?updated_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['id']).to eq(item2.id)
  end

  it "finds all items by merchant id" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant2.id)
    item3 = create(:item, merchant_id: merchant1.id)

    get "/api/v1/items/find_all?merchant_id=#{merchant1.id}"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([item1.id, item3.id])
  end

  it "finds all item items by unit price" do
    item1 = create(:item, unit_price: 2.99)
    item2 = create(:item, unit_price: 1.99)
    item3 = create(:item, unit_price: 1.99)

    get "/api/v1/items/find_all?unit_price=1.99"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([item2.id, item3.id])
  end

  it "finds all items by name" do
    item1 = create(:item, name: "Car")
    item2 = create(:item, name: "Bike")
    item3 = create(:item, name: "Car")

    get "/api/v1/items/find_all?name=car"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([item1.id, item3.id])
  end

  it "finds all items by description" do
    item1 = create(:item, description: "Car")
    item2 = create(:item, description: "Bike")
    item3 = create(:item, description: "Car")

    get "/api/v1/items/find_all?description=car"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([item1.id, item3.id])
  end

  it "finds all items by created at" do
    item1 = create(:item, created_at: "2016-10-05 12:12:12")
    item2 = create(:item, created_at: "2016-11-20 12:12:12")
    item3 = create(:item, created_at: "2016-10-05 12:12:12")

    get "/api/v1/items/find_all?created_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([item1.id, item3.id])
  end

  it "finds all items by updated at" do
    item1 = create(:item, updated_at: "2016-11-20 12:12:12")
    item2 = create(:item, updated_at: "2016-10-05 12:12:12")
    item3 = create(:item, updated_at: "2016-10-05 12:12:12")


    get "/api/v1/items/find_all?updated_at=2016-10-05 12:12:12"

    parsed_body = JSON.parse(response.body)

    ids = parsed_body.map do |item|
      item["id"]
    end

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(ids).to eq([item2.id, item3.id])
  end

  it "finds a random item" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    get "/api/v1/items/random"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect([item1.id, item2.id, item3.id]).to include parsed_body["id"]
  end
end
