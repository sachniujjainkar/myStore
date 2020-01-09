
class Product < ApplicationRecord
  # include PgSearch
  # pg_search_scope :search_by_full_name, against: [:sku, :name]

  has_many :order_product
  has_many :orders, through: :order_product
end
