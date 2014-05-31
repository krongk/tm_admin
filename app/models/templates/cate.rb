class Templates::Cate < ActiveRecord::Base
  has_many :templates
  validates :title, presence: true
end
