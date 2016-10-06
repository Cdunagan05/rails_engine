FactoryGirl.define do
  factory :merchant do
    name "MyName"

    factory :merchant_with_items do
      items { create_list(:item, 3)}
    end

    factory :merchant_with_invoices do
      invoices { create_list(:invoice, 3)}
    end

  end
end
