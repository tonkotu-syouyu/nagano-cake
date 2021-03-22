class SearchesController < ApplicationController
  def search
    @range = params[:range]
    # search = params[:search]
    # word = params[:word]

    if @range == "Customer"
　　@customers = Customer.looks(params[:search], params[:word])
　　elsif
　　@products = Product.looks(params[:search], params[:word])
　　else
　  @genres= Genre.looks(params[:search], params[:word])
    end
  end
end
