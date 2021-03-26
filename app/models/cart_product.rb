class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product


  def total_price
	  (self.product.price*1.1 * self.amount).to_i
  end

end
