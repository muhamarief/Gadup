class AddTransactionClassification < ActiveRecord::Migration[5.0]
  def change
    add_column :spendings, :classification, :boolean
    add_column :incomes, :classification, :boolean
  end
end
