class SitePage < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :template_page, class_name: 'Template::Page'
  has_many :site_images, -> { order("position ASC") }, :dependent => :destroy
  
  serialize  :form_content
end
