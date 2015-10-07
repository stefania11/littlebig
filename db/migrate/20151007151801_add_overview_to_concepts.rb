class AddOverviewToConcepts < ActiveRecord::Migration
  def change
    add_column :concepts, :overview, :text
  end
end
