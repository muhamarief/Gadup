class Api::V1::IncomesController < Api::V1::BaseController

  def create
    @user = User.find(params[:user_id])
    @wallet = current_authenticatee.wallets.first
    @income = Income.new(income_params)
    @income.wallet_id = params[:wallet_id]
    if @income.save
      redirect_to v1_user_wallet_path(@user, @wallet)
    else
      flash.now.alert = 'Some of your data is not valid'
      redirect_to v1_user_wallet_path(@user, @wallet)
    end
  end

  private
  def income_params
    params.require(:income).permit( :wallet_id,
                                    :nominal,
                                    :transaction_time,
                                    :description,
                                    :currency,
                                    :income_type)
  end
end
