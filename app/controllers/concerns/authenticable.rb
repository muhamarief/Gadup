module Authenticable
  extend ActiveSupport::Concern

  def current_api_key
    @current_api_key ||= ApiKey.includes(:owner).find_by(access_token: access_token)
  end

  def current_authenticatee
    return current_api_key.owner unless current_api_key.nil?
  end

end
