class AddUserForeignKeyToCard < ActiveRecord::Migration
  def change
    add_column :cards, :user_id, :integer
    add_index :cards, :user_id, unique: true
  end
end
