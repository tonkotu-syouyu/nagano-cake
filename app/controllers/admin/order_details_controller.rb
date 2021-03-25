class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update!(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order_detail.order.update(status: 2)
    end


    order = @order_detail.order
    # ①[orderに紐づく、order_detailの中でmaking_statusが3のもの]の数
    making_done_count = order.order_details.where(making_status: 3).count
    # ①とorderに紐づくorder_detailの数が同じなら、
    # (= orderに紐づくorder_detailが全て「制作完了」ということに等しい。
    if making_done_count == order.order_details.count
      order.update(status: 3)
    end

  
    redirect_back(fallback_location: admin_orders_path)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end


end
