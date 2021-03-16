class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      
      # enumで管理
      t.integer :status, defalut: 0
      
      t.integer :total_payment
      t.integer :shipping_cost
      
      # enumで管理
      t.integer :payment_method, defalut: 0
      
      t.timestamps
    end
  end
end
