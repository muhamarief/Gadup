class AddWalletSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :wallet_settings do |t|
      t.integer :save_plan
      t.references :wallets, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
