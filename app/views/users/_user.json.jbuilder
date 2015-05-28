json.(user, :id, :email, :created_at, :updated_at, :last_sign_in_at)
json.searches user.searches, partial: 'searches/search', as: :search