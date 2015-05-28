class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :email
      t.string :facebook
      t.string :twitter
      t.integer :sentiment
      t.integer :reach
      t.boolean :following_company
      t.date :first_brand_interaction

      t.timestamps null: false
    end
  end
end
