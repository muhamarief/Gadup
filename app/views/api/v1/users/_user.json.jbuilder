json.(user, :id, :username, :email)
json.(:created_at, :updated_at) unless user.id == nil
