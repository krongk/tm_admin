json.array!(@payment_coupons) do |payment_coupon|
  json.extract! payment_coupon, :id, :code, :start_at, :end_at, :price, :note
  json.url payment_coupon_url(payment_coupon, format: :json)
end
