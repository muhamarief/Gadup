class IncomesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @wallet = current_authenticatee.wallets.first
    @income = Income.new(income_params)
    @income.wallet_id = params[:wallet_id]
    @income.transaction_date = @income.transaction_time.to_date
    if @income.save
      redirect_to user_wallet_path(@user, @wallet)
    else
      flash.now.alert = 'Some of your data is not valid'
      redirect_to user_wallet_path(@user, @wallet)
    end
  end

  private
  def income_params
    params.require(:income).permit( :wallet_id,
                                    :nominal,
                                    :transaction_time,
                                    :description,
                                    :currency,
                                    :income_type,
                                    :classification,
                                    :category)
  end
end
