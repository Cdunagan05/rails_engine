json.array! @items do |item|
  json.id item.id
  json.name item.name
  json.description item.description
  json.unit_price item.unit_price
  json.merchant_id item.merchant_id
end
