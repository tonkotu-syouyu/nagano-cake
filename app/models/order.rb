class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details


  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  def total_payment
    sum = 0
    self.order_details.each do |order_detail|
      sum += order_detail.subtotal
    end
    sum
  end


end
