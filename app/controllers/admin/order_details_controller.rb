class Admin::OrderDetailsController < ApplicationController

  def update

    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items


    if @order_item.update(order_details_params)
        if @order_item.production_status == "production"
          @order.update(order_status: 2)
        end
        if @order_items.distinct.pluck(:production_status) == ["production_completed"]
          @order.update(order_status: 3)
        end
        redirect_to admin_order_path(@order.id)
    else
    render :show

    end

  end


  private

  def order_details_params
    params.require(:order_item).permit(:production_status)
  end


end
