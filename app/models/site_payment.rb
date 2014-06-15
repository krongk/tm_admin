class SitePayment < ActiveRecord::Base
  belongs_to :site
  validates  :site_id, :uniqueness => {:scope => [:site_id], :message => "already exists"}

  scope :count, ->(status) { where("status = ?", status).size }
end
