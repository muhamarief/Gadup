class AddCategoriesForIncomeSpending < ActiveRecord::Migration[5.0]
  def change
    add_column :spendings, :category, :integer
    add_column :incomes, :category, :integer
  end
end
