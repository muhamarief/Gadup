Rails.application.routes.draw do

  root 'welcome#index'
  resources :welcome, only: :edit do
    get 'hello_user', action: :show_user, on: :collection
    get 'hello_vendor', action: :show_vendor, on: :collection
  end


  api_version(:module => "Api::V1", :header => {:name => "Accept", :value => "application/vnd.gadup.com; version=1"}, :path => {:value => "v1"} ) do
    resources :users, only: [:create, :new, :show, :edit, :update, :destroy] do
      member do
        get :confirm_email
      end
      resources :wallets, only: [:create, :show] do
        resources :incomes, only: :create
        resources :spendings, only: :create
      end
    end

    namespace :auth do
      resources :users, only: [:new, :create, :destroy]
    end
  end

end
