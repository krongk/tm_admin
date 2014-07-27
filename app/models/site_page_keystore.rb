class SitePageKeystore < ActiveRecord::Base
  belongs_to :site_page
  belongs_to :common_key

  validates :site_page_id, :key_id, :value, presence: true

  def self.get(site_page_id, key_name)
    key = CommonKey.get(key_name)
    self.find_by(site_page_id: site_page_id, key_id: key.id)
  end

  def self.put(site_page_id, key_name, value)
    key = CommonKey.get(key_name)
    ks = self.find_or_create_by(site_page_id: site_page_id, key_id: key.id)
    ks.value = value
    ks.save!
    true
  end

  def self.value_for(site_page_id, key_name)
    key = CommonKey.get(key_name)
    self.get(site_page_id, key.id).try(:value)
  end

end
