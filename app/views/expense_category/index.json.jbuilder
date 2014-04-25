json.array!(@expense_category) do |expense_category|
  json.extract! expense_category, :id, :title, :description
  json.url expense_category_url(expense_category, format: :json)
end
