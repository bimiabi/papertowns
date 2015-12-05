json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :description, :product_model, :serial_number, :price, :stock, :image
  json.url product_url(product, format: :json)
end
