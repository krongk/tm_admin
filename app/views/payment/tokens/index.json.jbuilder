json.array!(@payment_tokens) do |payment_token|
  json.extract! payment_token, :id, :code, :user_id_id, :created_by, :status, :note
  json.url payment_token_url(payment_token, format: :json)
end
