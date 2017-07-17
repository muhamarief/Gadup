class EditWalletSettingTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :wallet_settings, :save_plan
    add_column :wallet_settings, :save_plan, :integer, default: 0
    add_column :wallet_settings, :active_save_plan, :boolean
  end
end
