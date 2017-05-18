class ChangeSpendingIncomeColumnNames < ActiveRecord::Migration[5.0]
  def change
    remove_column :incomes, :type
    remove_column :spendings, :type
    add_column :incomes, :income_type, :integer, null: false
    add_column :spendings, :spending_type, :integer, null: false
  end
end
