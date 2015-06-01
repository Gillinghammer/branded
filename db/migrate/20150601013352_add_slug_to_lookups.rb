class AddSlugToLookups < ActiveRecord::Migration
  def change
    add_column :lookups, :slug, :string
  end
end
