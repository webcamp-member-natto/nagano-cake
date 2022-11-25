class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    
    @order_items = @order.order_items
  end


  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if @order.update(order_params)
      if @order.order_status == "payment_confirmation"
      @order_items.update_all(production_status: 1)
      end
      redirect_to admin_order_path(@order.id)
    else
    render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
