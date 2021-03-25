class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @products_total_payment = calculate(@order)
    # @products = @order.ordered_products
  end

  def calculate(products_total_payment) # 商品合計を算出するメソッド
    @products_total_payment = 0
    @order_details.each {|order_detail|
    tax_in_price = (order_detail.product.price * 1.1).floor
    sub_total_price = tax_in_price * order_detail.amount
    @products_total_payment += sub_total_price
    }
    return @products_total_payment
  end

  # def order_status_update
  #   order = Order.find(params[:id])
  #   order.update(order_params)
  #   redirect_to admin_order_path(order)
  # end


  def making_status_update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(order_detail.order_id)
  end

  # def product_status_update
  #   order_detail = OrderDetail.find(params[:id])
  #   order_detail.update(order_detail_params)
  #   redirect_to admin_order_path(order_detail.order_id)
  # end


  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    @order.update(order_params)
      if @order.status = "入金確認"
        @order.order_details.each do |order_detail|
          order_detail.update(making_status: 1)
        end
      end
    redirect_back(fallback_location: admin_orders_path)
  end


#   after_order_update do
#   order = self.order
#   if order.update(order_status: "入金確認") == true #　条件分岐 : 注文ステータスが入金確認になったら
#     order_details.all? {|order_detail| order_detail.making_status == "制作待ち"} # 条件分岐 : 制作ステータスをすべて制作待ちにする
#   end
# end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
end