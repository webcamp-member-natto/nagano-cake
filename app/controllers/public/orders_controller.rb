class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.shipping_addresses
  end

  def comfirm
    @order = Order.new(order_params)

    @customer = current_customer
    @addresses = current_customer.shipping_addresses
    if params[:order][:address_select] == "0"
      @order.address=current_customer.address
      @order.name=current_customer.name
      @order.postal_code=current_customer.postal_code
    elsif params[:order][:address_select] == "1"
      if Address.exists?
        @order.name = ShippingAddress.find(params[:order][:address]).name
        @order.postal_code = ShippingAddress.find(params[:order][:address]).postal_code
        @order.address = ShippingAddress.find(params[:order][:address]).address
      end
    elsif params[:order][:address_select] == "2"
      address_new = current_customer.addresses.new(address_params)
        if address_new.save
          @order.address = address_new.address
          @order.name = address_new.name
          @order.postal_code = address_new.postal_code
          redirect_to public_order_path(@order.id)
        end
    else

    end
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :price)
  end

  def shipping_address_params
  params.require(:shipping_address).permit(:name, :address, :postal_code)
  end

end
