class AddFacebookIdAndTwitterIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :facebook_id, :string
    add_column :companies, :twitter_id, :string
  end
end
