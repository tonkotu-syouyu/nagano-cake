class Public::HomesController < ApplicationController
  def top
    @product = Product.limit(4).order("created_at DESC")
  end

  def about
  end
end
