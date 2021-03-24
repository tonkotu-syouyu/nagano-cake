class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details


  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  after_update do
    order_details = self.order.order_details
    if order_details.any? {|order_detail| order_detail.making_status == "製作中"} == true # 条件分岐：製作ステータスが1つでも製作中にだったら
      self.order.update(order_status: "製作中") # 注文ステータスを製作中に変更する
    elsif order_details.all? {|order_detail| order_detail.making_status == "製作完了"} == true # 条件分岐：製作ステータスが全て製作完了だったら
    self.order.update(order_status: "発送準備中") # 注文ステータスを発送準備中に変更する
    end
  end

end
