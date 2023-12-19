Rails.application.routes.draw do
 resources :couriers
  resources :users
  get 'order_statuses/index'
  get 'order_statuses/show'
  get 'order_statuses/new'
  get 'order_statuses/edit'
  get 'order_statuses/create'
  get 'order_statuses/update'
  get 'order_statuses/destroy'
  get 'product_orders/index'
  get 'product_orders/show'
  get 'product_orders/new'
  get 'product_orders/edit'
  get 'product_orders/create'
  get 'product_orders/update'
  get 'product_orders/destroy'
  get 'addresses/index'
  get 'addresses/show'
  get 'addresses/new'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'restaurants/index'
  get 'restaurants/show'
  get 'restaurants/new'
  get 'restaurants/edit'
  get 'restaurants/create'
  get 'restaurants/update'
  get 'restaurants/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :employees
  resources :customers
  # API
  namespace :api do
    post "login", to: "auth#index"
    get "restaurants", to: "restaurants#index"
    get "products", to: "products#index"
    get "orders", to: "orders#index"
    post "orders/:send_sms/:send_email", to: "orders#create"
    post "order/:id/:status", to: "orders#set_status"
    post "order/:id/rating", to: "orders#set_rating"

  end
end
