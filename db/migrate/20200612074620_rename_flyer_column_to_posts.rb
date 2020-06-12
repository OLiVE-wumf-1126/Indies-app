class RenameFlyerColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :flyer, :title
  end
end
