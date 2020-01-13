class Address < ApplicationRecord
  belongs_to :user
  has_many:orders

  validates_presence_of :line1, :city, :email, :state, :country

end
