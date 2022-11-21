class Public::CartItemsController < ApplicationController
  
  def index
    @cart_item = CartItem.all
  end
  
  def create
    
  
  private
  
  
end
