class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :member
  belongs_to :template, class_name: 'Templates::Template'
  has_many :site_pages, :dependent => :destroy
  has_many :site_comments, :dependent => :destroy
  has_one :site_payment, :dependent => :destroy

  STATUS = %w(vip thief)
end
