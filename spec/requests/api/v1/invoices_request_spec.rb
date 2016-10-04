require 'rails_helper'

describe "Invoices CRUD API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices.count).to eq(3)
  end

  it "returns one invoice record" do
    invoice = create(:invoice, status: "Invoice Test Status")
    get "/api/v1/invoices/#{invoice.id}"

    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body["status"]).to eq("Invoice Test Status")
  end
end
