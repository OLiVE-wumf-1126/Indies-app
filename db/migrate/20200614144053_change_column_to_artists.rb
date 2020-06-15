class ChangeColumnToArtists < ActiveRecord::Migration[5.2]
  def change
    change_column :artists, :artistname,:string, null: false
  end
end
