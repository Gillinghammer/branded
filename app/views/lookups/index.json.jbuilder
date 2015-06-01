json.array!(@lookups) do |lookup|
  json.extract! lookup, :id
  json.url lookup_url(lookup, format: :json)
end
