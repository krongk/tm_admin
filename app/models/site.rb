class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :template, class_name: 'Templates::Template'
  has_many :site_pages
  has_many :site_comments
  has_one :site_payment, :dependent => :destroy
end
