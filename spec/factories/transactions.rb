FactoryGirl.define do
  factory :transaction do
    credit_card_number "12345"
    invoice
  end
end
