class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:success] = "更新完了"
    redirect_to admin_orders_path
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
