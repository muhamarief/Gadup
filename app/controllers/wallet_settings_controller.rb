class WalletSettingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :update]

  def index
  end

  def create
  end

  def update
  end

end
