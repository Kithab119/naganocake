Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :public do
    get "/" => "homes#top"
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resource :customers, only: [:show, :edit, :update,]
    get "/customers/out" => "customers#out"
    patch "/customers/out_check" => "customers#out_check"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/order_check" => "orders#order_check"
    get "/orders/finish" => "orders#finish"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    get "/" => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end