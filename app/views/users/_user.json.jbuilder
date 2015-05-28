json.(user, :id, :email)
json.searches user.searches, partial: 'searches/search', as: :search