
Rails.application.routes.draw do

  namespace :public, path: "" do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    resources :products, only:[:index, :show]
    #resources :registrations, only:[:new, :create]
    #resources :sessions, only:[:new, :create, :destroy]
    resources :customers, only:[:edit, :update]
      get '/customers/my_page', to: 'customers#show'
      get 'customers/unsubscribe'
      patch 'customers/withdraw'
    resources :cart_products, only:[:index, :update, :destroy, :create]
      delete 'cart_products/destroy_all'
    resources :orders, only:[:new, :create, :index, :show]
      post 'orders/confirm'
      get 'orders/complete'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end


  devise_for :admins
   # admin
  namespace :admin do
    root 'homes#top'
    get 'homes/top'
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
  end

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get 'top' => 'public/homes#top'
end
