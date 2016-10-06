json.array! @invoice_transactions do |transaction|
  json.credit_card_number transaction.credit_card_number
  json.id transaction.id
  json.invoice_id transaction.invoice_id
  json.result transaction.result
end
