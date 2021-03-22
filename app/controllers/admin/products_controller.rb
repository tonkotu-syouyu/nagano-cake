class Admin::ProductsController < ApplicationController
before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]
  def index
    @products = Product.all.order(updated_at: :desc).page(params[:page]).per(10)
    @product = Product.new
    @genre = Genre.all
  end

  def new
    @products = Product.all.page(params[:page]).per(10)
    @product = Product.new
    @genre = Genre.new
  end

  def create
    # byebug
    @product = Product.new(product_params)
    # @genre = Genre.new
    if @product.save
      flash[:success] = "商品登録完了しました"
      redirect_to admin_products_path
    else
      flash.now[:warning] = "入力不備があります"
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
      redirect_to admin_products_path
      flash[:success] = "商品情報を更新しました"
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end
end
