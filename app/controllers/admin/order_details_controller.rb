class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.is_create == "manufacture"
      @order_detail.order.update(is_receive: "production")
    end
    flag = true
    @order_detail.order.order_details.each do |order_detail|
      if order_detail.is_create != "complete_manufacture"
        flag = false
        break
      end
    end
    if flag #ifの後は必ずtrue(1)かfalse(0)になる。※条件式の場合も結果がtrueかfalseに置き換わっている
      @order_detail.order.update(is_receive: "shipping_preparation")
    end
    redirect_to admin_order_path(@order_detail.order_id)
  end


  private
    def order_detail_params
      params.require(:order_detail).permit(:is_create)
    end

end
