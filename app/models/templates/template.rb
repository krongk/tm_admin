class Templates::Template < ActiveRecord::Base
  self.table_name = 'templates'
  belongs_to :cate
  has_many :pages, dependent: :destroy
  has_many :themes, dependent: :destroy
  has_many :sites

  after_save :assign_tags

  validates :title, :cate_id, :property, :base_url, :keywords, presence: true
  
  acts_as_taggable

  private

  def assign_tags
    if self.keywords  
      self.tag_list.add self.keywords.split(/[,;，。； ]+/).uniq.compact
    end
  end

end
