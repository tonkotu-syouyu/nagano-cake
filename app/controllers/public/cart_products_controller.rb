class Public::CartProductsController < ApplicationController
  before_action :setup_cart_product!, only: [:create_product, :update_product, :delete_product]


  def index
    @cart_products = current_cart.cart_products
  end

  def update
  end

  def destroy
    @cart_product.destroy
    redirect_to current_cart
  end

  def destroy_all
    @cart_product.destroy_all
    redirect_to current_cart
  end

  def create
    if @cart_product.blank?
      @cart_product = current_cart.cart_products.build(product_id: params[:product_id])
    end
    @cart_product.quantity += params[:amount].to_i
    @cart_product.save
    redirect_to current_cart
  end

  private

  def setup_cart_product!
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  end

end

# 商品一覧画面から、「商品購入」を押した時のアクション
  # def add_item
  #   if @cart_item.blank?
  #     @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
  #   end

  #   @cart_item.quantity += params[:quantity].to_i
  #   @cart_item.save
  #   redirect_to current_cart
  # end

  # # カート詳細画面から、「更新」を押した時のアクション
  # def update_item
  #   @cart_item.update(quantity: params[:quantity].to_i)
  #   redirect_to current_cart
  # end
