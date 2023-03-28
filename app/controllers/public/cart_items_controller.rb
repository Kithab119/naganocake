class Public::CartItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = Cart_item.all
    @cart_items.destroy
    redirect_to cart_items_path
  end


  private
    def cart_item_params
      params.require(:cart_item).permit()
    end

end
