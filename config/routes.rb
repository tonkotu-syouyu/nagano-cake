Rails.application.routes.draw do
  devise_for :users

  #namespace :public do
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
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get 'top' => 'public/homes#top'
end
