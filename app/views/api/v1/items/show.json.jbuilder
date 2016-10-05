json.name @item.name
json.description @item.description
json.unit_price ((@item.unit_price.to_i)/100.0).round(2).to_s
json.merchant_id @item.merchant_id
