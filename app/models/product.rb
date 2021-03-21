class Product < ApplicationRecord
  has_many :cart_products
  has_many :order_details
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def addTax
   taxed_money = self.price*1.1
  end
end
