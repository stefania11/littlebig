class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :concept_id
      t.integer :prompt_id

      t.timestamps null: false
    end
  end
end
