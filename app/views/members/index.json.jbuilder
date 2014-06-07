json.array!(@members) do |member|
  json.extract! member, :id, :user, :auth_type, :auth_id, :auth_token, :token_created_at, :token_confirmed, :current_sign_in_at, :last_sign_in_at
  json.url member_url(member, format: :json)
end
