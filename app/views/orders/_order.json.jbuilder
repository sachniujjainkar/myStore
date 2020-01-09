json.extract! order, :id, :order_no, :delivery_date, :special_instruction, :tracking_number, :order-total, :discount, :product_id, :created_at, :updated_at
json.url order_url(order, format: :json)
