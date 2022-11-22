class Customer < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders
  has_many :shipping_addresses
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
