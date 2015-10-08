class CreateBookmarkeds < ActiveRecord::Migration
  def change
    create_table :bookmarkeds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :prompt, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
