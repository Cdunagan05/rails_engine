require 'rails_helper'

RSpec.describe "Items relationships" do
  it "returns a collection of associated invoice items" do
    item1 = create(:item_with_invoice_items)
    item2 = create(:item_with_invoice_items)

    get "/api/v1/items/#{item2.id}/invoice_items"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body.count).to eq(3)
  end

  it "returns a collection of associated invoice items" do
    item1 = create(:item_with_merchant)
    item2 = create(:item_with_merchant)

    get "/api/v1/items/#{item2.id}/merchant"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body['id']).to eq(item2.merchant.id)
  end
end
