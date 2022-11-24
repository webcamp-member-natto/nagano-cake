class Admin::OrderDetailsController < ApplicationController

  def update
    if 
    @order = Order_Item.find(params[:id])
    @order.update(order_details_params)
    redirect_to admin_order_path(@order.id)

  end


  private

  def order_details_params
    params.require(:order_item_params).permit(:production_status)
  end


end
