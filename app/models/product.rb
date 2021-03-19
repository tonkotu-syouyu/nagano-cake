class Product < ApplicationRecord
  has_many :cart_products
  has_many :order_details
  belongs_to :genre, foreign_key: 'genre_id'

  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
