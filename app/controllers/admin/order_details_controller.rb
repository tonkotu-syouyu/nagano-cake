class Admin::OrderDetailsController < ApplicationController
    def update
      @order = Order.find(params[:id])
      @order_details.making_status = params[:order_details][:making_status]
      @order.update(order_params)
      flash[:success] = "更新完了"
      redirect_to admin_orders_detail_path
    end
  
  
  private
    def order_detail_params
		  params.require(:order_detail).permit(:making_status)
	  end
  
end
