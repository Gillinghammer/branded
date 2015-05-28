json.companies @companies do |company|
  json.(company, :id, :email_domain, :facebook_id, :twitter_id)
  json.users company.users, partial: 'users/user', as: :user
end