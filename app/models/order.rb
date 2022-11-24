class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
