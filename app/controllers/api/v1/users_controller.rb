class Api::V1::UsersController < Api::V1::BaseController

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      api_key = @user.api_keys.create!
      render json: { access_token: api_key.access_token }, status: :ok
    else
      render json: { error: "Email has been taken" }
    end
  end

  private
  def user_params
    permit(:email, :password, :password_confirmation, :username)
  end



end
