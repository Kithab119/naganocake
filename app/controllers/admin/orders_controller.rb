class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.is_receive == "payment_confirmation"
      @order.order_details.each do |order_detail|
        order_detail.update(is_create: "waiting_manufacture")
      end
    end
    redirect_to admin_order_path(@order.id)
  end


  private
    def order_params
      params.require(:order).permit(:is_receive)
    end

end
