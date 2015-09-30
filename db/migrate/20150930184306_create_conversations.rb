class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :prompt_id, index: true, foreign_key: true
      t.integer :response_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
