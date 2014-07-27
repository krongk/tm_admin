json.array!(@templates_keystores) do |templates_keystore|
  json.extract! templates_keystore, :id, :source_type, :source_id, :key, :value
  json.url templates_keystore_url(templates_keystore, format: :json)
end
