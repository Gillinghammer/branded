class Search < ActiveRecord::Base
  belongs_to :user
  # attr_accessor :email, :facebook, :twitter, :sentiment, :reach, :following_company, :first_brand_interaction
  
  private
  def search_params
    params.require(:search).permit(:email, :facebook, :twitter, :sentiment, :reach, :following_company, :first_brand_interaction)
  end
    
end
