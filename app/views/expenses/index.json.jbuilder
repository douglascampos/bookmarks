json.array!(@expenses) do |expense|
  json.extract! expense, :id, :description, :cost
  json.url expense_url(expense, format: :json)
end
