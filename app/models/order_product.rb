class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total
    product.price * quntity
    byebug
  end


end
