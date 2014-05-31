class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :template
  has_many :site_pages
  has_many :site_comments
end
