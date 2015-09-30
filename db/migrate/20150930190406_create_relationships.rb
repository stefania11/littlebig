class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :character, index: true, foreign_key: true
      t.references :prompt, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
