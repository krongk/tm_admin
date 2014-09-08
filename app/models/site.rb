class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :member
  belongs_to :template, class_name: 'Templates::Template'
  has_many :site_pages, :dependent => :destroy
  has_many :site_comments, :dependent => :destroy
  has_one :site_payment, :dependent => :destroy

  #thief: bad user, bad site -> not allow showing in case and template
  #recommend: good site -> show in template 
  #vip: payed site -> not show in case (if user ask for)
  STATUS = %w(vip-recommend vip recommend thief)
end
