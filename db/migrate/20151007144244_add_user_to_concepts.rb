class AddUserToConcepts < ActiveRecord::Migration
  def change
    add_reference :concepts, :user, index: true, foreign_key: true
  end
end
