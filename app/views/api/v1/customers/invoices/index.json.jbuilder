json.array! @invoices do |invoice|
  json.customer_id invoice.customer_id
  json.id invoice.id
  json.merchant_id invoice.merchant_id
  json.status invoice.status
end
