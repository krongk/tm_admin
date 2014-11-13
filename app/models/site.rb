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

  scope :payed, joins(:site_payment).where("site_payments.state = 'completed' || sites.status is not null").order("created_at DESC")

  def toggle_cate
    raise 'please put ENV["PRICE_VIP"]' if ENV["PRICE_VIP"].blank?

    self.cate =  self.cate == 'personal' ? 'business' : 'personal'
    self.site_payment.price = ENV["PRICE_VIP"]
    self.site_payment.save!
    self.save!
  end

end
