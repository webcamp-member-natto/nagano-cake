class CartItem < ApplicationRecord
  has_many :items, dependent: :destroy
  
  belongs_to :customer, dependent: :destroy
end
