class Order < ApplicationRecord
  belongs_to :costomer
  has_many :order_details
end
