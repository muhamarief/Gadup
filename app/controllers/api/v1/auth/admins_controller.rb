class Api::V1::Auth::AdminsController < Api::V1::BaseController

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to v1_admins_path
    else
      flash.now.alert = 'Email or password is invalid'
      redirect_to hello_admin_welcome_index_path
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to hello_admin_welcome_index_path
  end

end
