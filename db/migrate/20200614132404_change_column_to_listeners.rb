class ChangeColumnToListeners < ActiveRecord::Migration[5.2]
  def change
    change_column :listeners, :nickname,:string, null: false
  end
end
