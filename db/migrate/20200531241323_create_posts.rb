class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :artistname, null:false
      t.string :youtube_url, null:false
      t.text :text, null:false
      t.string :flyer
      t.references :artist, null:false, foreign_key: true

      t.timestamps
    end
  end
end
