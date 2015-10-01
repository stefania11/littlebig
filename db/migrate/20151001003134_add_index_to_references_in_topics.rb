class AddIndexToReferencesInTopics < ActiveRecord::Migration
  def change
    add_index :topics, :concept_id
    add_index :topics, :prompt_id
  end
end
