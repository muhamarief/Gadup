class CreateAllocatedBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :allocated_budgets do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false
      t.decimal :nominal, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end

    add_reference :spendings, :allocated_budget
  end
end
