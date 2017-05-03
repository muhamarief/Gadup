Rails.application.routes.draw do

  api_version(:module => "Api::V1", :header => {:name => "Accept", :value => "application/vnd.gadup.com; version=1"}, :path => {:value => "v1"}, :defaults => {:format => :json} ) do
    resources :users, only: [:create, :new] do
      get :confirm_email
    end
  end


end
