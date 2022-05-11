Rails.application.routes.draw do
  root "warehouses#index"

  resources :inventory_items
  resources :warehouses
end
