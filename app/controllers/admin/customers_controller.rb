class Admin::CustomersController < ApplicationController
  def index
<<<<<<< HEAD
    @customers = Customer.all.page(params[:page]).per(10)
=======
    @customers = Customer.all
>>>>>>> ad3e0ab485ea3707b41b554744022c2ed7e103c0
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

<<<<<<< HEAD
=======
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
  
>>>>>>> ad3e0ab485ea3707b41b554744022c2ed7e103c0
end
