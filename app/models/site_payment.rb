class SitePayment < ActiveRecord::Base
  belongs_to :site
  validates  :site_id, :uniqueness => {:scope => [:site_id], :message => "already exists"}

  scope :count, ->(state) { where("state = ?", state).size }
end
