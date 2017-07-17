class WalletSettingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update]
  layout 'user', only: [:index, :create, :update]

  def index
    @wallet = Wallet.find(params[:wallet_id])
    @wallet_setting = @wallet.wallet_setting
    if @wallet_setting.nil?
      activate_wallet_setting
      set_wallet_setting!
    else
      set_wallet_setting!
    end
  end

  def update
    @wallet = Wallet.find(params[:wallet_id])
    @wallet_setting = WalletSetting.find(params[:id])
    if @wallet_setting.update(wallet_setting_params)
      redirect_to user_wallet_wallet_settings_path(@current_authenticatee, @wallet, @wallet_setting)
    else
      redirect_to user_wallet_wallet_settings_path(@current_authenticatee, @wallet, @wallet_setting)
    end
  end

  private
  def activate_wallet_setting
    @wallet_setting = WalletSetting.new(wallet_id: @wallet.id, active_save_plan: false)
    @wallet_setting.save
  end

  def set_wallet_setting!
    @monthly_income = @wallet.incomes.where('income_type > ?', 1)
    @monthly_spending = @wallet.spendings.where('spending_type > ?', 1)
    @spending = Spending.new
    @income = Income.new
  end

  def wallet_setting_params
    params.require(:wallet_setting).permit(:save_plan, :active_save_plan)
  end

end
