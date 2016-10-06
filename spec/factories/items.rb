FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyString"
    unit_price "MyString"
    merchant

    factory :item_with_invoice_items do
      invoice_items { create_list(:invoice_item, 3) }
    end

    factory :item_with_merchant do
      merchant { create(:merchant) }
    end
  end
end
