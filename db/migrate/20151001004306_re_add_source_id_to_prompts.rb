class ReAddSourceIdToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :source_id, :integer
  end
end
