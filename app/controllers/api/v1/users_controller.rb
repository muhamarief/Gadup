class Api::V1::UsersController < Api::V1::BaseController

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      render json: { success: "Please confirm your email address to continue" }
    else
      render json: { error: "Email has been taken" }
    end
  end

  def confirm_email
    user = User.find_by(confirmation_token: params[:id])
    if user
      if user.confirmation_expired?
        user.after_expired_confirmation_email
        UserMailer.welcome_email(@user).deliver_later
        render json: { success: "Please confirm your email address to continue" }
      else
        user.activate_account
        @user = user
        api_key = @user.api_keys.create!
        render json: { access_token: api_key.access_token }, status: :ok
      end
    else
      render json: { error: "Sorry. User does not exist" }
    end
  end

  private
  def user_params
    permit(:email, :password, :password_confirmation, :username)
  end

end
