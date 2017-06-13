class WalletsController < ApplicationController

  def show
    @wallet = current_authenticatee.wallets.first
    @income = Income.new
    @spending = Spending.new
  end

end
