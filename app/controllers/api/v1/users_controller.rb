class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_me!, only: :show

  def new
    @user = User.new
    # #Api based rails
    # respond_with @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      # UserMailer.delay.welcome_email(@user)
      # UserMailer.welcome_email(@user).deliver_now

      # #api based rails
      # render json: { success: "Please confirm your email address to continue" }

      #view based rails
      flash.now.alert = 'Anda telah berhasil membuat akun, silahkan melakukan konfirmasi email, melalui email yang anda gunakan'
      redirect_to root_path
    else
      # #api based rails
      # render json: { error: "Email has been taken" }

      #view based rails
      flash.now.alert = 'Email telah digunakan'
      redirect_to root_path
    end
  end

  def confirm_email
    user = User.find_by(confirmation_token: params[:id])
    if user
      if user.confirmation_expired?
        user.after_expired_confirmation_email
        # UserMailer.welcome_email(@user).deliver_later
        UserMailer.delay.welcome_email(@user)
        # UserMailer.welcome_email(@user).deliver_now


        # #api based rails
        # render json: { success: "Silahkan melakukan konfirmasi email, melalui email yang anda gunakan" }

        #view based rails
        flash.now.alert = 'Anda telah berhasil membuat akun, silahkan melakukan konfirmasi email, melalui email yang anda gunakan'
        redirect_to root_path
      else
        user.activate_account
        @user = user
        api_key = @user.api_keys.create!
        # #api based rails
        # render json: { access_token: api_key.access_token }, status: :ok

        #view based rails
        redirect_to v1_user_path(@user.username)
      end
    else
      render json: { error: "Maaf. User tidak ditemukan, silahkan melakukan pendaftaran kembali" }
      redirect_to root_path
    end
  end

  def show
    @user = current_authenticatee
  end

  private
  # #API based rails
  # def user_params
  #   permit(:email, :password, :password_confirmation, :username)
  # end

  #view based rails
  def user_params
    params.require(:user).permit( :email,
                                  :password,
                                  :password_confirmation,
                                  :username)
  end

  def authenticate_me!
    render_unauthorized unless current_authenticatee and current_authenticate.kind_of?(User)
    @user = current_authenticatee
  end


end
