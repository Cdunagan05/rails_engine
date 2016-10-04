require 'rails_helper'

describe "Invoice Items CRUD API" do
  it "returns a list of invoice items" do
    create_list(:invoice_item, 3)
    get "/api/v1/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end

  it "returns one invoice item record" do
    invoice_item = create(:invoice_item, quantity: 99)
    get "/api/v1/invoice_items/#{invoice_item.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["quantity"]).to eq(99)
  end
end
