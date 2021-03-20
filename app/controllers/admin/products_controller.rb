class Admin::ProductsController < ApplicationController
before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]
  def index
    @products = Product.all
  end

  def new
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path(@product)
    else
      flash[:warning] = "商品名を入力してくだたい"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path(@product)
      flash[:success] = "商品情報を更新しました"
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:genre_is, :name, :itroduction, :price, :image_id, :is_active)
  end
end
