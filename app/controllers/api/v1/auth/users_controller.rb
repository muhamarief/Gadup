class Api::V1::Auth::UsersController < Api::V1::BaseController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      api_key = user.api_keys.create!
      # #api based rails
      # render json: { access_token: api_key.access_token }

      #view based rails
      redirect_to v1_user_path(@user.username)
    else
      # #api based rails
      # render json: { error: "Invalid email or password" }, status: :unauthorized

      #view based rails
      flash.now.alert = 'Email or password is invalid'
      redirect_to root_path
    end
  end

  def destroy
    ApiKey.find_by(access_token: params[:id]).destroy
    # #api based rails
    # head :no_content

    #view based rails
    redirect_to root_path
  end

end
