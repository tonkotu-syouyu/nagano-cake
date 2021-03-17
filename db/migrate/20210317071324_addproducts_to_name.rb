class AddproductsToName < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string
    add_column :products, :is_active, :boolean
    add_column :products, :price, :integer
    add_column :products, :introduction, :text
    add_column :products, :image_id, :string
    add_reference :products, :genre_id, foreign_key: true
  end
end
