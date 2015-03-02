json.array!(@albums) do |album|
  json.extract! album, :id, :name, :live
  json.url album_url(album, format: :json)
end
