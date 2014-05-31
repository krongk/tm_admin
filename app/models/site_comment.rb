class SiteComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :template_page
end
