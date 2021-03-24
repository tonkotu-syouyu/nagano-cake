class OrderDetail < ApplicationRecord
<<<<<<< HEAD
  # belongs_to :customer
=======
  belongs_to :order
>>>>>>> origin/develop
  belongs_to :product

  enum making_status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }

<<<<<<< HEAD
=======


  def subtotal
	  (self.price * self.amount)
	end
>>>>>>> origin/develop

  
end
