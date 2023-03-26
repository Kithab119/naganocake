class Public::HomesController < ApplicationController

  def top
    @orders = Order.all                      #.first(4)
    @items = Item.all.order(created_at: :desc).limit(4)
  end

  def about
  end

end
