json.array! @searches do |search|
  json.facebook search.facebook
  json.twitter search.twitter
  json.email search.email
end
