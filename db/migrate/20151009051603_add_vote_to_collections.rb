class AddVoteToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :vote, :string
  end
end
