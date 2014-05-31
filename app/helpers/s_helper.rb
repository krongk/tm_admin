module SHelper
  def get_temp_url(site_page, temp_url)
    [site_page.template_page.template.base_url, '/', temp_url].join()
  end

  def get_seo_title(site_page)
    site_page.title
  end
  def get_seo_meta_keywords(site_page)
    site_page.title
  end
  def get_seo_meta_description(site_page)
    site_page.title
  end

end
