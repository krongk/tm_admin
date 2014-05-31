json.array!(@template_themes) do |template_theme|
  json.extract! template_theme, :id, :template_template_id, :title, :css_url, :preview_images, :preview_url
  json.url template_theme_url(template_theme, format: :json)
end
