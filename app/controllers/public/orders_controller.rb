class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def order_check
    @cart_items = current_customer.cart_items
    @sum = 0
    @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = address.postal_code
      @order.shipping_address = address.address
      @order.shipping_name = address.name
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.save
    redirect_to orders_finish_path
  end

  def finish
  end


  private
    def order_params
      params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :postage, :claim, :payment, :is_receive)
    end

end
