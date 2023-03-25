class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end


  private
    def order_params
      params.require(:order, :order_detail).parmit(:is_receive, :is_create)
    end

end
