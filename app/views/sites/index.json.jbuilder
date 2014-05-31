json.array!(@sites) do |site|
  json.extract! site, :id, :user_id, :template_id, :sort_title, :title, :description, :domain, :is_published
  json.url site_url(site, format: :json)
end
