class CreateLookups < ActiveRecord::Migration
  def change
    create_table :lookups do |t|
        t.string :email
        t.json :clearbit_result
      t.timestamps null: false
    end
  end
end
