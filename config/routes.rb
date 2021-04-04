Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  resources :orders
  patch '/orders/:id/update_status', to: 'orders#update_status', as: 'update_status'
  root to: "products#index"
end
