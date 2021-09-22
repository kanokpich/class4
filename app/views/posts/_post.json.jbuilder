json.extract! post, :id, :msg, :datepost, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
