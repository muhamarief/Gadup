class Api::V1::WalletsController < Api::V1::BaseController

  def show
    @wallet = current_authenticatee.wallets.first
    @income = Income.new
    @spending = Spending.new
  end

end
