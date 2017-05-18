class WelcomeController < ApplicationController
  layout 'welcome_user', only: [:edit]
  before_action

  def index
    if current_authenticatee && info_updated?
      redirect_to v1_user_path(current_authenticatee)
    elsif current_authenticatee && !info_updated?
      redirect_to edit_welcome_path(current_authenticatee)
    else
      @user = User.new
    end
  end

  def edit
    @user = current_authenticatee
  end

  def info_updated?
    if current_authenticatee.gender.nil? || current_authenticatee.phone_number.nil? || current_authenticatee.birthday.nil?
      return false
    else
      return true
    end
  end
end
