class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def order_check
    #@order = Order.new(order_params)
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new()
  end

end
