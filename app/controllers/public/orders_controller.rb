class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_product = CartProduct.find(params[:id])
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
