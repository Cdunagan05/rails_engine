json.array! @merchants do |merchant|
  json.id merchant.id
  json.name merchant.name
  json.created_at merchant.created_at
  json.updated_at merchant.updated_at
end
