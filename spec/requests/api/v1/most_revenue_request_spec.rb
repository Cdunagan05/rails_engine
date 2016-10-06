require 'rails_helper'

RSpec.describe "Most revenue" do
  it "returns merchant with most revenue" do

    get "/api/v1/merchants/most_revenue?quantity=x"

  end
end
