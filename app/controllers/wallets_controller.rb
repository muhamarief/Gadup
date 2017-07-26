class WalletsController < ApplicationController

  def show
    @user = current_authenticatee
    @wallet = current_authenticatee.wallets.first
    @income = Income.new
    @spending = Spending.new
  end

end
