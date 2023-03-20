class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params{:id})
  end

end
