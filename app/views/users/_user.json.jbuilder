json.extract! user, :id, :email, :name, :birthday, :created_at, :updated_at, :address, :postal_code
json.url user_url(user, format: :json)
