json.extract! search_link, :id, :name, :url, :site_id, :created_at, :updated_at
json.url search_link_url(search_link, format: :json)
