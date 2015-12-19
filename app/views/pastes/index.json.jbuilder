json.array!(@pastes) do |paste|
  json.extract! paste, :id, :user_id, :title, :content
  json.url paste_url(paste, format: :json)
end
