class RemoveGenreIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :products, :genre_id
    remove_reference :products, :genre_id, index: true
  end
end
