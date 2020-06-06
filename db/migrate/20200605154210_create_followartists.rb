class CreateFollowartists < ActiveRecord::Migration[5.2]
  def change
    create_table :followartists do |t|
      t.references :listener, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
