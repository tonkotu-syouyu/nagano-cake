class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "登録完了しました"
      redirect_to admin_products_path
    else
      flash[:warning] = "入力内容をご確認ください"
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
      flash[:success] = "更新成功"
      redirect_to admin_products_path
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :image_id, :price, :introduction, :genre_id, :is_active)
    end
end
