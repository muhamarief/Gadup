class Api::V1::AdminsController < Api::V1::BaseController


  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def admin_params
    if current_authenticatee.super_admin
      params.permit(  :name,
                      :email,
                      :password,
                      :password_confirmation,
                      :super_admin
      )
    else
      params.permit(  :name,
                      :email,
                      :password,
                      :password_confirmation
      )
    end
  end

end
