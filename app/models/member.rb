class Member < ActiveRecord::Base
  has_many :sites, :dependent => :destroy
end
