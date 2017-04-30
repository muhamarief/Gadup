class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_current_admin, only: :show

  def show
    @user
  end

  private
  def set_current_user
    @user = User.find(params[:id])
  end

end
