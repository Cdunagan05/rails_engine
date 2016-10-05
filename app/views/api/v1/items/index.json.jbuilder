json.array! @items do |item|
  json.description item.description
  json.id item.id
  json.merchant_id item.merchant_id
  json.unit_price item.unit_price.to_i/100
  json.name item.name
end
