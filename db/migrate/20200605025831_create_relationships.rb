class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :listener, foreign_key: true
      t.references :follow, foreign_key: { to_table: :listeners }

      t.timestamps

      t.index [:listener_id, :follow_id], unique: true
    end
  end
end
