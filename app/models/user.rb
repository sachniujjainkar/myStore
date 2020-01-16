class User < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :addresses, dependent: :destroy
    
#Validations
    validates :firstname, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 }, 
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }


    accepts_nested_attributes_for :addresses, allow_destroy: true
    
    #to use bcrypt
    has_secure_password

    
end
