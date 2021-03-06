json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :display, :phone_number, :email
  json.url customer_url(customer, format: :json)
end
