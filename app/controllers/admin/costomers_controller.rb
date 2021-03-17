class Admin::CostomersController < ApplicationController
  def index
    @costomers = Costomer.all
  end

  def show
    @costomer = Costomer.find(params[:id])
  end

  def edit
    @costomer = Costomer.find(params[:id])
  end

  def update
    @costomer = Costomer.find(params[:id])
    if @customer.update(costomer_params)
      flash[:success] = "更新完了"
      redirect_to admin_costomers_path(@customer)
    else
      flash[:warning] = "入力内容を確認してください"
      render :edit
    end
  end
  
   private
  	def costomer_params
  		params.require(:costomer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_numder, :email, :is_deleted)
  	end
  
end
