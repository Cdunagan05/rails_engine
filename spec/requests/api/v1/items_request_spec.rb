require 'rails_helper'

RSpec.describe "Item CRUD API" do
  it "returns a list of all items" do
    create_list(:item, 3)
    get "/api/v1/items"

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(3)
  end

  it "returns one item record" do
    item = create(:item, name: "My Test Item")
    get "/api/v1/items/#{item.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body['name']).to eq("My Test Item")
  end
end
