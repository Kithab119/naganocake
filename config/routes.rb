Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do #URLは変わらずに、コントローラを呼び出せる
    root to: "homes#top" #"文字列型"、'文字列型、変数'
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    get "/customers/out" => "customers#out"
    patch "/customers/out_check" => "customers#out_check"
    resource :customers, only: [:show, :edit, :update,]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all" #destroyのURL => cart_items/destroy_all
    resources :cart_items, only: [:index, :update, :destroy, :create] #destroyのURL => cart_items/:id、上記のURLと重複する為、優先度を下にする。
    post "/orders/order_check" => "orders#order_check"
    get "/orders/finish" => "orders#finish"
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do #URLに権限を付けて、コントローラを呼び出せる
    root to: "homes#top"
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end