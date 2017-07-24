Rails.application.routes.draw do

  root 'welcome#index'
  get '_ah/health', to: 'app_engine#health'

  authenticated :user do
    root :to => 'users#show'
  end

  resources :welcome, only: :edit do
    get 'hello_user', action: :auth_user, on: :collection
    get 'hello_vendor', action: :auth_vendor, on: :collection
    get 'hello_admin', action: :auth_admin, on: :collection, constraints: { subdomain: 'admin' }
  end

  #admin pages
  resources :admins, constraints: { subdomain: 'admin' } do
    resources :feeds, only: :create do
      resources :entries, only: :create
    end
  end
  resources :feeds, except: :create, constraints: { subdomain: 'admin' } do
    resources :entries, except: :create
  end
  resources :gadup_tips, except: :show, constraints: { subdomain: 'admin' }
  get 'tips/:id', to: 'gadup_tips#show'


  #users pages
  resources :users do
    member do
      get :confirm_email
    end
    resources :wallets, only: [:create, :show] do
      resources :incomes, only: :create
      resources :spendings, only: :create
      resources :wallet_settings, only: [:index, :create, :update]
    end
  end
  get 'news', to: 'entries#public_news'
  get 'finance_tips', to: 'entries#public_articles'
  resources :entries, only: :index do
    get 'news', on: :collection
  end



  #authentication pages
  namespace :auth do
    resources :users, only: [:new, :create, :destroy]
    resources :admins, only: [:new, :create, :destroy], constraints: { subdomain: 'admin' }
  end


  # GADUP API ROUTES
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

    #users pages
    resources :users do
      member do
        get :confirm_email
      end
      resources :wallets, only: [:create, :show] do
        resources :incomes, only: :create
        resources :spendings, only: :create
      end
    end
    resources :entries, only: :index

    #authentication pages
    namespace :auth do
      resources :users, only: [:new, :create, :destroy]
      resources :admins, only: [:new, :create, :destroy], constraints: { subdomain: 'admin' }
    end
  end

end
