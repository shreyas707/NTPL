json.extract! deliver_product, :id, :delivery_id, :product_id, :delivery_quantity, :price, :created_at, :updated_at
json.url deliver_product_url(deliver_product, format: :json)
