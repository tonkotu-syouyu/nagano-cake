class Public::CartProductsController < ApplicationController
  before_action :setup_cart_product!, only: [:create_product, :update_product, :delete_product]
  before_action :authenticate_customer!


  def index
    @cart_products = current_customer.cart_products
  end

  def update
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to public_cart_products_path
  end

  def destroy_all
    @cart_product = current_customer.cart_products
    @cart_product.destroy_all
    redirect_to public_cart_products_path
  end

  def create
    @cart_product = current_customer.cart_products.new
    @cart_product.product_id = params[:product_id]
    @cart_product.amount = params[:cart_product][:amount]
    @cart_product.save
    redirect_to public_cart_products_path
  end

  private

  def setup_cart_product!
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  end

end

