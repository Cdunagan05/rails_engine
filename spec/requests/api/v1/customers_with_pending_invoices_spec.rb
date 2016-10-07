require 'rails_helper'

RSpec.describe "Customers with pending invoices" do
  it "returns a collection of customers which have pending (unpaid) invoices" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

  end
end
