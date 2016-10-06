require 'rails_helper'

RSpec.describe "Merchants relationships" do
  it "returns a collection of items associated with the merchant" do
    merchant1 = create(:merchant_with_items)
    merchant2 = create(:merchant_with_items)

    get "/api/v1/merchants/#{merchant1.id}/items"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body.count).to eq(3)
  end

  it "returns a collection of invoices associated with that merchant" do
    merchant1 = create(:merchant_with_invoices)
    merchant2 = create(:merchant_with_invoices)

    get "/api/v1/merchants/#{merchant1.id}/invoices"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body.count).to eq(3)
  end
end
