class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      
      t.integer :genre_id
      
      t.boolean :is_active, defalut: true
      
      t.string :name
      t.integer :price
      t.text :introduction
      t.string :image_id

      t.timestamps
    end
  end
end
