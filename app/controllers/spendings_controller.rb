class SpendingsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @wallet = current_authenticatee.wallets.first
    @spending = Spending.new(spending_params)
    @spending.wallet_id = params[:wallet_id]
    @spending.spending_date = @spending.spending_time.to_date

    if @spending.save
      redirect_to user_wallet_path(@user, @wallet)
    else
      flash.now.alert = 'Some of your data is not valid'
      redirect_to user_wallet_path(@user, @wallet)
    end
  end

  private
  def spending_params
    params.require(:spending).permit( :wallet_id,
                                      :nominal,
                                      :spending_time,
                                      :description,
                                      :currency,
                                      :spending_type,
                                      :classification,
                                      :category)
      end

end
