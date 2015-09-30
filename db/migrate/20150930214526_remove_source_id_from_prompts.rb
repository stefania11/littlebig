class RemoveSourceIdFromPrompts < ActiveRecord::Migration
  def change
    remove_column :prompts, :source_id
  end
end
