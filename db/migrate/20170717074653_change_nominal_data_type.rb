class ChangeNominalDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :spendings, :nominal, :decimal
    change_column :incomes, :nominal, :decimal
  end
end
