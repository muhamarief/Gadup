class AddCurrenciesToWallet < ActiveRecord::Migration[5.0]
  def change
    add_column :wallets, :currency, :string, null: false, default: 'IDR'
  end
end
