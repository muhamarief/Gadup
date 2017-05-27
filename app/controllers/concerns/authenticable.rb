module Authenticable
  extend ActiveSupport::Concern

  ## Rails Api Based Authenticable
  # def current_api_key
  #   @current_api_key ||= ApiKey.includes(:owner).find_by(access_token: access_token)
  # end
  #
  # def current_authenticatee
  #   return current_api_key.owner unless current_api_key.nil?
  # end

  # Rails session based Authentiacble
  def current_authenticatee
    if session[:user_id]
      @current_authenticatee ||= User.find(session[:user_id])
    elsif session[:admin_id]
      @current_authenticatee ||= Admin.find(session[:admin_id])
    else
      nil
    end
  end

  def authenticate_admin!
    render_unauthorized unless current_authenticatee && current_authenticatee.kind_of?(Admin)
  end

  def authenticate_super_admin!
    render_unauthorized unless current_authenticatee && current_authenticatee.kind_of?(Admin) && current_authenticatee.super_admin
  end

  def authenticate_user!
    render_unauthorized unless current_authenticatee && current_authenticatee.kind_of?(User)
  end

  def render_unauthorized
    render :file => "public/401.html", :status => :unauthorized
  end

end
