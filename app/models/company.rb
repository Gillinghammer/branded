class Company < ActiveRecord::Base
  has_many :users, dependent: :delete_all, validate: false

  def self.count
    return Company.all.size
  end

  def company_params
    params.require(:company).permit(:name, :email_domain)
  end

end
