json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :bonus
  json.url track_url(track, format: :json)
end
