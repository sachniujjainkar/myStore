class Order < ApplicationRecord

  attr_accessor :user_attributes, :address_attributes
  # accepts_nested_attributes_for :user, :address
  after_create :updateInventory

  belongs_to :address
  belongs_to :user

  has_many :order_products,  dependent: :destroy
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products


  def updateInventory
    oldQ =  Order.first.order_products.first.product.quantity 
    newQ = Order.first.order_products.first.quntity
    # Order.first.order_products.first.product.quantity =  Order.first.order_products.first.product.quantity - Order.first.order_products.first.quntity
    updatedQ = oldQ -newQ 
    Product.update_counters params[:id], :quantity => updatedQ
  end  

end
