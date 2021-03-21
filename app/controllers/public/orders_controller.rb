class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new
    @order.payment_method = params[:payment_method]
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address

  end

  def complete
  end

  def create


  end

  def index
  end

  def show
  end

end
