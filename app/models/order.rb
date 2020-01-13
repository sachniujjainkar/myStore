class Order < ApplicationRecord

  # attr_accessor :user_attributes, :address_attributes
#   accepts_nested_attributes_for :user, :address

  belongs_to :address
  belongs_to :user

  has_many :order_product,  dependent: :destroy
  has_many :products, through: :order_product
  accepts_nested_attributes_for :order_product, allow_destroy: true
  
end
