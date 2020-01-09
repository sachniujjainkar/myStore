Rails.application.routes.draw do
  resources :addresses
  resources :users
  resources :order_products
  resources :orders
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
