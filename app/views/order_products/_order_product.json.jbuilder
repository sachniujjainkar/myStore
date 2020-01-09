json.extract! order_product, :id, :quntity, :product_id, :order_id, :created_at, :updated_at
json.url order_product_url(order_product, format: :json)
