class PasswordDigestForAdmins < ActiveRecord::Migration[5.0]
  def change
    remove_column :admins, :encrypted_password
    add_column :admins, :password_digest, :string, null: false
  end
end
