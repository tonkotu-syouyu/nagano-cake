class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def total_price
	  (self.product.price*1.1 * self.amount).to_i
	end

# 　def total_sum
# 　  cart_product.to_a.sum { |cart_product| cart_product.total_price }
# 　end
end
