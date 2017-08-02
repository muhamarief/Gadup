class UsersController < ApplicationController
  before_action :authenticate_me!, only: [:show, :edit, :update, :destroy]
  layout 'user', only: :show

  def new
    @user = User.new

    # #Api based rails
    # respond_with @user
  end

  def create
    @user = User.new(user_params)
    @user.set_full_name
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
        UserMailer.welcome_email(@user).deliver_later
        # UserMailer.delay.welcome_email(@user)
        # UserMailer.welcome_email(@user).deliver_now


        # #api based rails
        # render json: { success: "Silahkan melakukan konfirmasi email, melalui email yang anda gunakan" }

        #view based rails
        flash.now.alert = 'Anda telah berhasil membuat akun, silahkan melakukan konfirmasi email, melalui email yang anda gunakan'
        redirect_to root_path
      else
        @user = user
        @user.activate_account
        @user.wallets.create!

        # #api based rails
        # api_key = @user.api_keys.create!
        # render json: { access_token: api_key.access_token }, status: :ok

        #view based rails
        session[:user_id] = @user.id
        redirect_to edit_welcome_path(@user)
      end
    else
      # #api based rails
      # render json: { error: "Maaf. User tidak ditemukan, silahkan melakukan pendaftaran kembali" }

      #view based rails
      redirect_to root_path
    end
  end

  def show
    @wallet = current_authenticatee.wallets.first

    @spendings = @wallet.spendings.all
    @spending_shows = @spendings.order(spending_time: :desc).limit(5)
    @incomes = @wallet.incomes.all
    @income_shows = @incomes.order(transaction_time: :desc).limit(5)

    @monthly_spendings = @spendings.where('spending_type = ?', 2)
    @total_monthly_spending = 0
    @monthly_spendings.each do |spending|
      @total_monthly_spending += spending.nominal
    end

    @total_spending = 0.to_d

    @spendings.each do |spending|
      @total_spending += spending.nominal
    end

    @total_income = 0.to_d
    @incomes.each do |income|
      @total_income += income.nominal
    end

    @balance = @total_income - @total_spending

    # @entries = Entry.where('category = ?', 1).order('id DESC').limit(6)
    # @entries_array = @entries.each_slice(2).to_a
  end

  def edit
    @user = current_authenticatee
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path(current_authenticatee, current_authenticatee.full_name)
    else
      render 'welcome/edit'
    end
  end

  def destroy
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
                                  :first_name,
                                  :last_name,
                                  :gender,
                                  :phone_number,
                                  :city,
                                  :birthday,
                                  :profile_picture
                                  )
  end

  def authenticate_me!
    # #api
    # render_unauthorized unless current_authenticatee and current_authenticatee.kind_of?(User)
    # @user = current_authenticatee

    #session
    if current_authenticatee && current_authenticatee.kind_of?(User) && params[:id].to_i == current_authenticatee.id
      @user = current_authenticatee
    else
      render :file => "public/401.html", :status => :unauthorized
    end
  end
end
