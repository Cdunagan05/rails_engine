FactoryGirl.define do
  factory :customer do
    first_name "FirstName"
    last_name "LastName"

    factory :customer_with_invoices do
      invoices { create_list(:invoice, 3)}
    end
  end
end
