json.extract! site, :id, :title, :url, :created_at, :updated_at
json.url site_url(site, format: :json)
