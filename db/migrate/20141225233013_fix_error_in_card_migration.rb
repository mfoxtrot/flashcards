class FixErrorInCardMigration < ActiveRecord::Migration
  def change
    remove_index :cards, :user_id
    add_index :cards, :user_id
    change_column_null :cards, :user_id, false, 0
  end
end
