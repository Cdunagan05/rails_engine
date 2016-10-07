json.array! @invoices do |invoice|
  json.id invoice.id
  json.status invoice.status
  json.customer_id invoice.customer_id
  json.merchant_id invoice.merchant_id
end
