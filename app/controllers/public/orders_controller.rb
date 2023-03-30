class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def order_check
    @cart_items = current_customer.cart_items
    @sum = 0
    @order = Order.new(order_params)
    
    if select_address == 0
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif select_address == 1
      address_
    else select_address == 2
      新しく登録したアドレス
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
