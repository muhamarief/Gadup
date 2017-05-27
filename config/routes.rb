Rails.application.routes.draw do

  root 'welcome#index'

  devise_for :users
  devise_for :admins

  resources :welcome, only: :edit do
    get 'hello_user', action: :auth_user, on: :collection
    get 'hello_vendor', action: :auth_vendor, on: :collection
    get 'hello_admin', action: :auth_admin, on: :collection, constraints: { subdomain: 'admin' }
  end


  api_version(:module => "Api::V1", :header => {:name => "Accept", :value => "application/vnd.gadup.com; version=1"}, :path => {:value => "v1"} ) do

    #admin pages
    resources :admins, constraints: { subdomain: 'admin' } do
      resources :feeds, only: :create do
        resources :entries, only: :create
      end
    end
    resources :feeds, except: :create, constraints: { subdomain: 'admin' } do
      resources :entries, except: :create
    end

    resources :users do
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
      resources :admins, only: [:new, :create, :destroy], constraints: { subdomain: 'admin' }
    end
  end

end
