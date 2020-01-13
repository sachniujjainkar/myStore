class Product < ApplicationRecord
  has_many :order_product
  has_many :orders, through: :order_product

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    end
  end

end
