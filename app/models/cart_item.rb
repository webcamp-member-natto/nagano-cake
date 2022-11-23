class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :quantity, presence: true

  def subtotal
    # subtotalは小計のこと
    item.with_tax_price * quantity
  end
end
