class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "更新完了"
      redirect_to admin_customers_path(@customer)
    else
      flash[:warning] = "入力内容を確認してください"
      render :edit
    end
  end
  
   private
  	def costomer_params
  		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_numder, :email, :is_deleted)
  	end
  
end
