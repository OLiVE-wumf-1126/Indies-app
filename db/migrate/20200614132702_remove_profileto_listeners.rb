class RemoveProfiletoListeners < ActiveRecord::Migration[5.2]
  def change
    remove_column :listeners, :profile, :text
  end
end
