class WelcomeController < ApplicationController

  def index
    @user = User.new
  end

  def edit
    @user = current_authenticatee
  end

end
