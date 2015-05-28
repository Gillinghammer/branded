json.extract! @user, :email, :id, :created_at, :updated_at, :last_sign_in_at
json.company @user.get_company
json.company_facebook @user.get_company_facebook
json.company_twitter @user.get_company_twitter
json.searches @user.searches, partial: 'searches/search', as: :search