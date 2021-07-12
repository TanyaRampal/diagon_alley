Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index"

  resources :shop_items
  resources :shop_categories
  resources :shops

  resources :cart_items
  resources :carts

  resources :orders

  resources :users

  resources :new_users

  resources :reports

  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  get "/pending_orders" => "orders#show_pending", as: :pending_orders
  get "/delivered_orders" => "orders#show_delivered", as: :delivered_orders

  get "/all_users" => "new_users#show_all_users", as: :all_users
end
