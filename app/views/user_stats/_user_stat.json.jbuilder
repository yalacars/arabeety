json.extract! user_stat, :id, :state, :email, :created_at, :updated_at
json.url user_stat_url(user_stat, format: :json)
