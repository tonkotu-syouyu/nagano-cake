class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # @products = OrderDetail.create_today
    # @count = @products.count
    @orders = Order.all.page(params[:page]).per(10)
  end
end
