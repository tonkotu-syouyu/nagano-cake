class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

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
