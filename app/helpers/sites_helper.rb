module SitesHelper

  def get_site_preview(site)
    [ENV["WED_HOST"], 's-' + site.short_title].join('/')
  end
end
