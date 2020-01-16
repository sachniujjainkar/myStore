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
    byebug
    old =  Order.first.order_products.first.product.quantity 
    new = Order.first.order_products.first.quntity
    # Order.first.order_products.first.product.quantity =  Order.first.order_products.first.product.quantity - Order.first.order_products.first.quntity
    updated = old -new 
    Product.update_counters params[:id], :quantity => updated
    byebug
  end  


  # def self.search(search)
  #   if search
  #     where('name LIKE ?', "%#{search}%")
  #   else
  #     all
  #   end
  # end

end
