class AppEngineController < ApplicationController
  def health
    render plain: 'OK'
  end
end
