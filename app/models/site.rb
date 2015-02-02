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

  scope :payed, joins(:site_payment).where("site_payments.price <> 0.00").where("site_payments.state = 'completed' || sites.status is not null").order("created_at DESC")

  def toggle_typo
    raise 'please put ENV["PRICE_VIP"]' if ENV["PRICE_VIP"].blank?

    self.typo = self.typo == 'personal' ? 'business' : 'personal'
    self.site_payment.price = self.typo == 'personal' ? ENV["PRICE_PERSONAL"] : ENV["PRICE_BUSINESS"]
    self.site_payment.save!
    self.save!
  end

  def set_free
    self.site_payment.price = 0.00
    self.site_payment.state = 'completed'
    self.site_payment.completed_at = Time.now
    self.site_payment.save!
    self.status = 'vip-recommend'
    self.save!
    expire_cache
  end

  def image_count
    SiteImage.joins(:site_page).where("site_pages.site_id = #{self.id}").count
  end

  private
    #cache tm_wed
    # tm_admin, tm_wed must all in /alidata/www/ folder
    def expire_cache
      cache_paths = []
      cache_paths << File.join('..', 'tm_wed', 'public', 'page_cache', 's-' + self.short_title + '.html')
      self.site_pages.each do |site_page|
        cache_paths << File.join('..', 'tm_wed', 'public', 'page_cache', "s-#{self.short_title}", "p-#{site_page.short_title}.html")
      end
      cache_paths.each do |path|
        if File.exist?(path)
          FileUtils.rm_rf path
        end
      end
    end

end
