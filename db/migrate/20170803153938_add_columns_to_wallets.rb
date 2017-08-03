class AddColumnsToWallets < ActiveRecord::Migration[5.0]
  def change
    add_column :wallets, :wallet_name, :string
    add_column :wallets, :wallet_currency, :string
  end
end
