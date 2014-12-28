class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string
    change_column_null :users, :crypted_password, false, "123"
    add_column :users, :salt, :string
    change_column_null :users, :salt, false, "123"
    add_index :users, :email, unique: true
  end
end
