json.array!(@password_category) do |password_category|
  json.extract! password_category, :id, :titulo, :descricao
  json.url password_category_url(password_category, format: :json)
end
