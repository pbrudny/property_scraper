json.extract! ad, :id, :title, :url, :phone, :price, :status, :district_id, :type, :created_at, :updated_at
json.url ad_url(ad, format: :json)
