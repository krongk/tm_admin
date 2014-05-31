json.array!(@site_comments) do |site_comment|
  json.extract! site_comment, :id, :user_id, :site_id, :template_page_id, :name, :mobile_phone, :tel_phone, :email, :qq, :weixin, :address, :gender, :birth, :hobby, :content, :content2, :content3, :status
  json.url site_comment_url(site_comment, format: :json)
end
