class DropTableAdmins < ActiveRecord::Migration[5.2]
  def change
    drop_table :admins do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
     end
  end
end
