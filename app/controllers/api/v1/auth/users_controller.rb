class Api::V1::Auth::UsersController < Api::V1::BaseController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # #api based rails
      # api_key = user.api_keys.create!
      # render json: { access_token: api_key.access_token }

      #view based rails
      session[:user_id] = user.id
      redirect_to v1_user_path(@user.id)
    else
      # #api based rails
      # render json: { error: "Invalid email or password" }, status: :unauthorized

      #view based rails
      flash.now.alert = 'Email or password is invalid'
      redirect_to root_path
    end
  end

  def destroy
    # #api based rails
    # ApiKey.find_by(access_token: params[:id]).destroy
    # head :no_content

    #view based rails
    session[:user_id] = nil
    redirect_to root_path
  end

end
