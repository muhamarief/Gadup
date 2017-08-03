class WalletsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def create
  end

  def show
    @user = current_authenticatee
    @wallet = current_authenticatee.wallets.first
    @income = Income.new
    @spending = Spending.new
  end

end
