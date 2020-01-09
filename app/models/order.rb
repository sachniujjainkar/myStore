class Order < ApplicationRecord
  attr_accessor :user_attributes, :address_attributes



  belongs_to :address
  belongs_to :user

  has_many :order_product
  has_many :products, through: :order_product

  accepts_nested_attributes_for :user, :address
end
