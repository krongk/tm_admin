json.array!(@template_pages) do |template_page|
  json.extract! template_page, :id, :template_template_id, :sort_id, :title, :temp_url, :temp_form_url, :demo_img
  json.url template_page_url(template_page, format: :json)
end
