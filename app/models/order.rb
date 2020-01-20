class Order < ApplicationRecord

  attr_accessor :user_attributes, :address_attributes
  # accepts_nested_attributes_for :user, :address
  after_create :update_inventory
  after_update :update_inventory

  belongs_to :address
  belongs_to :user

  has_many :order_products,  dependent: :destroy
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products

  def update_inventory
    order = self
    byebug
    order.order_products.each do |o|
      oldQ = o.product.quantity
      unit = o.quntity
      byebug
      updated = oldQ - unit
      o.product.quantity = updated
      o.save
      byebug
    end
  end 

  @model.update_attributes(attributes)

end


# def update_inventory
#   order = self
#   byebug
  
#   oldQ = order.order_products.first.product.quantity
#   unit = order.order_products.first.quntity
#   byebug
#   updated = oldQ - unit
#   order.order_products.first.product.quantity = updated
#   byebug
# end
