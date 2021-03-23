
Rails.application.routes.draw do

 get 'search' => "searches#search"


  get 'search/search'
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :public, path: "" do

    root to: 'homes#top'
    get '/about', to: 'homes#about'
    resources :products, only:[:index, :show]
    #resources :registrations, only:[:new, :create]
    #resources :sessions, only:[:new, :create, :destroy]
    patch 'customers/withdraw', to: 'customers#withdraw'
    resources :customers, only:[:edit, :update]
      get '/customers/my_page', to: 'customers#show'
      get 'customers/unsubscribe'
      # put 'customers/withdraw', to: 'customers#withdraw'
    delete 'cart_products/destroy_all'
    resources :cart_products, only:[:index, :update, :destroy, :create]
     get 'orders/complete'
    post 'orders/confirm'
    resources :orders, only:[:new, :create, :index, :show]

    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end



  devise_for :admins, controllers: {
     sessinons: 'admins/sessions',
     passwords: 'admins/passwords',
     registrations: 'admins/registrations'
  }

   # admin
  namespace :admin do
    root 'homes#top'
    get 'homes/top'

    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update, :index]
    resources :orders_details, only: [:update]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get 'top' => 'public/homes#top'
end

