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
    order.order_products.each do |orderp| 
         byebug
    end
    byebug
  end  

end
