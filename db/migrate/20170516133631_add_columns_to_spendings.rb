class AddColumnsToSpendings < ActiveRecord::Migration[5.0]
  def change
    add_column :spendings, :description, :string
    add_column :spendings, :photos, :JSON
    add_column :spendings, :type, :integer
    add_column :spendings, :currency, :string, null: false, default: 'IDR'
  end
end
