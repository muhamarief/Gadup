class AddCurrenciesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :currency, :string, null: false, default: 'IDR'
  end
end
