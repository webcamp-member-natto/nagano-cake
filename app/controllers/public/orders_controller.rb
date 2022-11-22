class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def complete

  end



end
