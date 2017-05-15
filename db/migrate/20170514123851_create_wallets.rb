class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.references :owner, polymorphic: true, null: false
      t.float :wallet_balance, null: false, default: 0

      t.timestamps
    end
  end
end
