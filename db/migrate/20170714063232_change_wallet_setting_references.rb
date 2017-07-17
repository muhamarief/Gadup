class ChangeWalletSettingReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :wallet_settings, :wallets_id
    add_reference :wallet_settings, :wallet, index: { unique: true }, foreign_key: true
  end
end
