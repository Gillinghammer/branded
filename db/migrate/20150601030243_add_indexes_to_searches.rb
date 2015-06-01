class AddIndexesToSearches < ActiveRecord::Migration
  def change
    add_index :searches, :user_id
    add_index :searches, :lookup_id
    add_index :searches, [:user_id, :lookup_id], unique: true
  end
end
