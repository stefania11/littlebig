class ChangeBookmarkedsToCollections < ActiveRecord::Migration
  def change
    rename_table :bookmarkeds, :collections
  end
end
