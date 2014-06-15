json.array!(@site_payments) do |site_payment|
  json.extract! site_payment, :id, :site_id, :status, :pay_type, :price, :pay_at, :updated_by, :note, :is_processed
  json.url site_payment_url(site_payment, format: :json)
end
