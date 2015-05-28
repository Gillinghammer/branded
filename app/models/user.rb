class User < ActiveRecord::Base
has_many :searches, dependent: :delete_all, validate: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  def user_params
       params.require(:user).permit(:remember_me, :email, :password, :password_confirmation)
  end

  # def to_jbuilder
  #   Jbuilder.new do |json|
  #     json.searches do
  #       json.array! self.searches do |search|
  #         json.child! search.to_jbuilder.attributes!
  #       end
  #     end
  #   end
  # end

end
