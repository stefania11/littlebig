json.array!(@prompts) do |prompt|
  json.extract! prompt, :id, :body
  json.url prompt_url(prompt, format: :json)
end
