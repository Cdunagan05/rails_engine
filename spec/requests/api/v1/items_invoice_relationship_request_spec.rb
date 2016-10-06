require 'rails_helper'

RSpec.describe "Items invoice relationships" do
  it "returns the associated invoice" do
    invoice_item1 = create(:invoice_item_with_invoice)
    invoice_item2 = create(:invoice_item_with_invoice)

    get "/api/v1/invoice_items/#{invoice_item1.id}/invoice"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body['id']).to eq(invoice_item1.invoice.id)
  end

  it "returns the associated item" do
    invoice_item1 = create(:invoice_item_with_item)
    invoice_item2 = create(:invoice_item_with_item)

    get "/api/v1/invoice_items/#{invoice_item2.id}/item"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body['id']).to eq(invoice_item2.item.id)
  end
end
