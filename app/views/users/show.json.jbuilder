json.extract! @user, :email, :id, :created_at, :updated_at, :last_sign_in_at

json.artists @artists do |artist|
  json.id artist.id
  json.name artist.name
  json.label artist.label
end