json.array!(@concepts) do |concept|
  json.extract! concept, :id, :name
  json.url concept_url(concept, format: :json)
end
