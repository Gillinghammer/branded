json.array! @companies do |company|
  json.(company, :id, :email_domain, :facebook_id, :twitter_id)
  json.total_users company.users.count
  json.users company.users, partial: 'users/user', as: :user
end