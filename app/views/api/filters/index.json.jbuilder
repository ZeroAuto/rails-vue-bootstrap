json.filters @filters.each do |filter|
  json.id filter.id
  json.created_at l(filter.created_at, format: :default)
  json.fields filter.fields
  json.search_term filter.search_term
end