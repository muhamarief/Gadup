class AddDateAndTimeForIncomeSpending < ActiveRecord::Migration[5.0]
  def change
    add_column :spendings, :spending_date, :date
    add_column :incomes, :transaction_date, :date
  end
end
