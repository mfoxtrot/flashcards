class ChangeTextColumnsToString < ActiveRecord::Migration
  def change
    change_column :cards, :original_text, :string
    change_column :cards, :translated_text, :string
  end
end
