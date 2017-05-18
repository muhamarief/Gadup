class AddColumnsToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :description, :string
    add_column :incomes, :photos, :JSON
    add_column :incomes, :type, :integer
    add_column :incomes, :currency, :string, null: false, default: 'IDR'
  end
end
