class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items      #任意のキー
    else
      @items = Item.looks(params[:word])
      #looksは別の名前でもOK。※モデルを参照
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
