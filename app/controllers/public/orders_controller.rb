class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.shipping_addresses
  end

  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    # @total_price = current_customer.cart_itemsの小計を全部合わせたもの
    @postage = 800
    @customer = current_customer
    @addresses = current_customer.shipping_addresses
    if params[:select_address] == "0"
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
    elsif params[:select_address] == "1"
      if ShippingAddress.exists?
        @order.address = ShippingAddress.find(params[:order][:address_id]).address
        @order.name = ShippingAddress.find(params[:order][:address_id]).name
        @order.postal_code = ShippingAddress.find(params[:order][:address_id]).postal_code
      end
    elsif params[:select_address] == "2"
      @address_new = current_customer.shipping_addresses.new(shipping_address_params)
      #address_new.costomer_id = current_customer.id
        if @address_new.save
          @order.address = @address_new.address
          @order.name = @address_new.name
          @order.postal_code = @address_new.postal_code
        else
          render :new
        end
    else
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @postage = 800
    if @order.save
      redirect_to public_complete_path
    else
      #render :comfirm
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :price, :postage)
  end

  def shipping_address_params
  params.require(:order).permit(:name, :address, :postal_code)
  end

end
