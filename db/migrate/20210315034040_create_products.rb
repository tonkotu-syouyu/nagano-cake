class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|



      t.boolean :is_active, defalut: true

      t.string :name
      t.integer :price
      t.text :introduction
      t.string :image_id

      t.timestamps
      t.references :genre, index: true
    end
  end
end
