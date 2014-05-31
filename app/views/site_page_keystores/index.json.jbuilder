json.array!(@site_page_keystores) do |site_page_keystore|
  json.extract! site_page_keystore, :id, :site_page_id, :key, :value
  json.url site_page_keystore_url(site_page_keystore, format: :json)
end
