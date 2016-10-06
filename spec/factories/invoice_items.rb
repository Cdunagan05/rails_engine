FactoryGirl.define do
  factory :invoice_item do
    quantity "MyString"
    unit_price 1.5
    item
    invoice

    factory :invoice_item_with_invoice do
      invoice { create(:invoice) }
    end

    factory :invoice_item_with_item do
      item { create(:item) }
    end
  end
end
