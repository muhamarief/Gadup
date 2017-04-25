Rails.application.routes.draw do

  devise_for :users
  api_version(:module => "Api::V1", :header => {:name => "Accept", :value => "application/vnd.gadup.com; version=1"}, :path => {:value => "v1"}, :defaults => {:format => :json}, :default => true) do
    resources :users, only: :show
  end
end
