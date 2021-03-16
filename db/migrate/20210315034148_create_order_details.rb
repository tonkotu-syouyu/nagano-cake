class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      
      t.integer :product_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      
      # enumで管理
      t.integer :making_status, defalut: 0

      t.timestamps
    end
  end
end
