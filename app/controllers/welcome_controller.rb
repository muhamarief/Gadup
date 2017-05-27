class WelcomeController < ApplicationController
  layout 'welcome_user', only: [:edit]

  def index
    if current_authenticatee && info_updated?
      redirect_to v1_user_path(current_authenticatee)
    elsif current_authenticatee && !info_updated?
      redirect_to edit_welcome_path(current_authenticatee)
    else
      render :index
    end
  end

  def edit
    @user = current_authenticatee
  end

  def auth_user
    @user = User.new
  end

  def auth_admin
    @admin = Admin.new
  end

  def auth_vendor
    @vendor
  end

  private
  def info_updated?
    if current_authenticatee.gender.nil? || current_authenticatee.phone_number.nil? || current_authenticatee.birthday.nil?
      return false
    else
      return true
    end
  end
end
