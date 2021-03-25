class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update!(order_detail_params)
    if @order_detail.making_status = "製作中"
      @order_detail.order.status.update(status: 2)
    end
      i = 1
    while i= @order_detail do
      if @order_detail.making_status = 3
         @order_detail.order.status.update(status:3)
         break
      end
      i += 1
    end
    redirect_back(fallback_location: admin_orders_path)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end


end
