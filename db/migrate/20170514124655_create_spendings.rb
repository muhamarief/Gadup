class CreateSpendings < ActiveRecord::Migration[5.0]
  def change
    create_table :spendings do |t|
      t.float :nominal, null: false
      t.date :spending_date, null: false
      t.time :spending_time, null: false
      t.references :wallet, null: false

      t.timestamps
    end
  end
end
