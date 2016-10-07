json.array! @merchant_customers do |merchant_customer|
  json.id merchant_customer.id
  json.first_name merchant_customer.first_name
  json.last_name merchant_customer.last_name
end
