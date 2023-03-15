Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items

  resources :

  namespace :admin do
    resources :admins
  end

  namespace :admin do
    resources :items
  end

  namespace :admin do
    resources :genres
  end

  namespace :admin do
    resources :items
  end

  namespace :admin do
    resources :customers
  end

end
