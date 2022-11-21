class CartItem < ApplicationRecord
  has_many :items, dependent: :destroy
  has_one :customer, dependent: :destroy
end
