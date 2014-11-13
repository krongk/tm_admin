json.array!(@biz_sites) do |biz_site|
  json.extract! biz_site, :id, :title, :thumb, :url, :description
  json.url biz_site_url(biz_site, format: :json)
end
