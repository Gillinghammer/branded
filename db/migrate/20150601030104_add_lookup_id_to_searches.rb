class AddLookupIdToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :lookup_id, :integer
  end
end
