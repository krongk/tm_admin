json.array!(@template_templates) do |template_template|
  json.extract! template_template, :id, :template_cate_id, :property, :base_url, :title, :description, :demo_img
  json.url template_template_url(template_template, format: :json)
end
