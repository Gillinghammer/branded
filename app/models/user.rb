class User < ActiveRecord::Base
has_many :searches, dependent: :delete_all, validate: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
