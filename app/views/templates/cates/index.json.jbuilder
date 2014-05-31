json.array!(@template_cates) do |template_cate|
  json.extract! template_cate, :id, :title, :description
  json.url template_cate_url(template_cate, format: :json)
end
