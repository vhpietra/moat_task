json.extract! album, :id, :album_name, :year, :artist, :created_at, :updated_at
json.url album_url(album, format: :json)
