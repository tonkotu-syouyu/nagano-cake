class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).reverse_order
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
      # 三項演算子
      is_deleted = params[:customer][:is_deleted] == '無効' ? true : false
      
      @customer.update(is_deleted: is_deleted)
      
      redirect_to admin_customer_path(@customer.id), notice: '会員情報を更新しました。'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postal_code,
      :address,
      :telephone_number,
      :email,
      :admittion_status)
  end

end
