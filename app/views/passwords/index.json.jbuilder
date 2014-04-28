json.array!(@passwords) do |password|
  json.extract! password, :id, :login, :pass, :url, :obs
  json.url password_url(password, format: :json)
end
