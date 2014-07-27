class Payment::Token < ActiveRecord::Base
  belongs_to :user #, -> {user.has_role?(ENV["ROLES"]['VIP'])}
  before_create :create_unique_code
  attr_accessor :count
  #
  scope :active, -> { where status: 'active' }
  scope :inactive, -> { where status: 'inactive' }
  #
  scope :owner, ->(usesr_id) { where("user_id = ?", usesr_id) }
  scope :count, ->(status) { where("status = ?", status).size }
  scope :user_count, ->(user_id, status) { where("user_id = ? AND status = ?", user_id, status).size }

  private
    def create_unique_code
      begin
        self.code = SecureRandom.hex(3)
      end while self.class.exists?(:code => code)
    end
end


# belongs_to :firm, foreign_key: "client_of"
# belongs_to :person, primary_key: "name", foreign_key: "person_name"
# belongs_to :author, class_name: "Person", foreign_key: "author_id"
# belongs_to :valid_coupon, ->(o) { where "discounts > #{o.payments_count}" },
#                           class_name: "Coupon", foreign_key: "coupon_id"
# belongs_to :attachable, polymorphic: true
# belongs_to :project, readonly: true
# belongs_to :post, counter_cache: true
# belongs_to :company, touch: true
# belongs_to :company, touch: :employees_last_updated_at