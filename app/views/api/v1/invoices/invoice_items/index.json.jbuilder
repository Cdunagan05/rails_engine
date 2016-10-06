json.array! @invoice_items do |invoice_item|
  json.invoice_id invoice_item.invoice_id
  json.id invoice_item.id
  json.unit_price ((invoice_item.unit_price.to_i)/100.0).round(2).to_s
  json.item_id invoice_item.item_id
  json.quantity invoice_item.quantity
end
