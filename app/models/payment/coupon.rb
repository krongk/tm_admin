class Payment::Coupon < ActiveRecord::Base
  before_create :create_unique_code
  #empty
  validates :price, presence: true

  private
    def create_unique_code
      begin
        self.code = SecureRandom.hex(3)
      end while self.class.exists?(:code => code)
    end
end
