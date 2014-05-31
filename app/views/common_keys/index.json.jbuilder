json.array!(@common_keys) do |common_key|
  json.extract! common_key, :id, :name, :type, :title, :placeholder, :hint, :default_value
  json.url common_key_url(common_key, format: :json)
end
