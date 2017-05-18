class Api::V1::SpendingsController < Api::V1::BaseController

  def create
    @user = User.find(params[:user_id])
    @wallet = current_authenticatee.wallets.first
    @spending = Spending.new(spending_params)
    @spending.wallet_id = params[:wallet_id]
    if @spending.save
      redirect_to v1_user_wallet_path(@user, @wallet)
    else
      flash.now.alert = 'Some of your data is not valid'
      redirect_to v1_user_wallet_path(@user, @wallet)
    end
  end

  private
  def spending_params
    params.require(:spending).permit( :wallet_id,
                                      :nominal,
                                      :spending_time,
                                      :description,
                                      :currency,
                                      :spending_type)
      end

end
