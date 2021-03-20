class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "登録完了しました"
      redirect_to admin_genres_path
    else
      flash.now[:warning] = "入力内容をご確認ください"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "更新成功"
    redirect_to admin_genres_path
    else
      render 'edit'
    end
  end


    private
  	def genre_params
  		params.require(:genre).permit(:name,:is_disable,params[:name])
  	end

end
