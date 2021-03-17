class Public::CartProductsController < ApplicationController

  def index
  end

  def update
  end

  def destroy
    product = Product.find(paramd[:id])
    product.destroy
  end

  def destroy_all
  end

  def create
  end

end
