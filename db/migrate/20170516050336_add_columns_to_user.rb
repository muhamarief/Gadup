class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
    add_column :users, :city, :string
    add_column :users, :profile_picture, :string
    add_column :users, :phone_number, :string
  end
end
