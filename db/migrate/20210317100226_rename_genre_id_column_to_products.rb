class RenameGenreIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :genre, foreign_key: true
  end
end
