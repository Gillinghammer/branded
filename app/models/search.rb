class Search < ActiveRecord::Base
  belongs_to :user
  belongs_to :lookup
  validates :user_id, presence: true
  validates :lookup_id, presence: true
  
  private
  def search_params
    params.require(:search).permit(:email, :facebook, :twitter, :sentiment, :reach, :following_company, :first_brand_interaction)
  end
    
end
