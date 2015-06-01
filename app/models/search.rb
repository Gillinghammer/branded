class Search < ActiveRecord::Base
  belongs_to :user
  belongs_to :lookup
  validates :user_id, presence: true
  validates :lookup_id, presence: true

  def copy_clearbit
    puts "copying clearbit information"
    @lookup = Lookup.find(self.lookup_id)
    clearbit = @lookup.clearbit_result
    if clearbit
      self.reach = clearbit['klout']['score']
      self.email = clearbit["email"]
      self.facebook = clearbit["facebook"]["handle"]
      self.twitter = clearbit["twitter"]["handle"]
    end
    self.save
  end

  
  private
  def search_params
    params.require(:search).permit(:email, :facebook, :twitter, :sentiment, :reach, :following_company, :first_brand_interaction, :lookup_id, :user_id)
  end
    
end
