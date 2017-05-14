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
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
