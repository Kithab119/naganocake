class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @items = Item.looks(params[:word])
    #looksは別の名前でもOK。※モデルを参照
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
