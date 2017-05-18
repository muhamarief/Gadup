class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.float :nominal, null: false
      t.datetime :transaction_time, null: false
      t.references :wallet, null: false

      t.timestamps
    end
  end
end
