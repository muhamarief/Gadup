Rails.application.routes.draw do

  #rails view based root path
  root 'welcome#index'
  api_version(:module => "Api::V1", :header => {:name => "Accept", :value => "application/vnd.gadup.com; version=1"}, :path => {:value => "v1"} ) do
    resources :users, only: [:create, :new, :show] do
      member do
        get :confirm_email
      end
    end

    namespace :auth do
      resources :users, only: [:new, :create, :destroy]
    end
  end

  # #rails api based paths
  # api_version(:module => "Api::V1", :header => {:name => "Accept", :value => "application/vnd.gadup.com; version=1"}, :path => {:value => "v1"}, :defaults => {:format => :json} ) do
  #   resources :users, only: [:create, :new, :show] do
  #     member do
  #       get :confirm_email
  #     end
  #   end
  #
  #   namespace :auth do
  #     resources :users, only: [:new, :create, :destroy]
  #   end
  # end


end
