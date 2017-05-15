class AddColumnToIncomeSpendings < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :description, :string
    add_column :spendings, :description, :string
    add_column :incomes, :photos, :JSON
    add_column :spendings, :photos, :JSON
  end
end
