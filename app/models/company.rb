class Company < ActiveRecord::Base
  has_many :users, dependent: :delete_all, validate: false

  def company_params
    params.require(:company).permit(:name, :email_domain)
  end

end
