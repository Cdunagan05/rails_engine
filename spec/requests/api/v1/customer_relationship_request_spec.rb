require 'rails_helper'

RSpec.describe "Customer relationships" do
  it "returns collection of associated invoices" do
    customer1 = create(:customer_with_invoices)
    customer2 = create(:customer_with_invoices)

    get "/api/v1/customers/#{customer1.id}/invoices"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body.count).to eq(3)
  end

  it "returns a collection of associated transactions" do
    customer1 = create(:customer_with_invoices)
    customer1.invoices.each do |invoice|
      invoice.transactions << create_list(:transaction, 3)
    end

    get "/api/v1/customers/#{customer1.id}/transactions"

    parsed_body = JSON.parse(response.body)

    expect(parsed_body.count).to eq(9)
  end
end
