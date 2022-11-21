class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  belongs_to :customer
end
