json.extract! message, :id, :user_id, :admin_id, :text, :conversation_id, :created_at, :updated_at
json.url message_url(message, format: :json)
