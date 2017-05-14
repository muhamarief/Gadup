json.(user, :id, :full_name, :first_name, :last_name, :email)
json.(:created_at, :updated_at) unless user.id == nil
