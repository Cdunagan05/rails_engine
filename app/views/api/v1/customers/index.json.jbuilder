json.array! @customers do |customer|
  json.first_name customer.first_name
  json.id customer.id
  json.last_name customer.last_name
end
