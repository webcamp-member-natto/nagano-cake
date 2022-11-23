class ShippingAddress < ApplicationRecord
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
  belongs_to :customer
  
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :name, presence: true
end
