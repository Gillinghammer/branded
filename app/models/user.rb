class User < ActiveRecord::Base
has_many :searches, foreign_key: "user_id", dependent: :destroy
has_many :searches, foreign_key: "lookup_id", dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def get_company
    Company.find(self.company_id).name
  end

  def get_company_facebook
    Company.find(self.company_id).facebook_id
  end

  def get_company_twitter
    Company.find(self.company_id).twitter_id
  end

  def get_company_domain
    Company.find(self.company_id).email_domain
  end

  private
  def user_params
       params.require(:user).permit(:remember_me, :email, :password, :password_confirmation)
  end

end
