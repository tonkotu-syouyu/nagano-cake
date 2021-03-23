class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new
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
      # @orer.name = params[:order][:addresses_name]
    end
    session[:order] = @order
  end

  def complete
  end

  def create
    @order = Order.new(session[:order])
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to public_orders_complete_path, notice: 'You have created book successfully'
    end
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
    @customer = current_customer
  end

  def show
    @order = Order.find(params[:id])
    # @orders.cart_product =
  end

end
