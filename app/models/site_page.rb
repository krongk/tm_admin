class SitePage < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :template_page, class_name: 'Template::Page'

  serialize  :form_content
end
