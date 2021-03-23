class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method]
    #ご自身の住所を選択した時
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    #登録済み住所から選択した時
    elsif params[:order][:address_option] == "1"
      @order_address = Address.find(params[:order][:selected_address])
      @order.postal_code = @order_address.postal_code
      @order.address = @order_address.address
      @order.name = @order_address.name
    #新しいお届け先を選択した時
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:order_address]
      @order.name = params[:order][:addresses_name]
    end
    session[:order] = @order
  end

  def complete
  end

  def create
    @order = Order.new(session[:order])
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @cart_products = current_customer.cart_products
    if @order.save
      current_customer.cart_products.each do |cart_product|
        order_detail = OrderDetail.new(product_id: cart_product.product.id,order_id: @order.id,price: cart_product.product.price,amount: cart_product.amount,making_status:  "着手不可")
        order_detail.save
      end
      @cart_products.destroy_all
      redirect_to public_orders_complete_path, notice: 'You have created book successfully'
    end
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

end
