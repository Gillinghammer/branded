class Company < ActiveRecord::Base
  has_many :users, dependent: :delete_all, validate: false

  private
  def company_params
    put "company params??"
    params.require(:company).permit(:facebook_id)

  end

end
