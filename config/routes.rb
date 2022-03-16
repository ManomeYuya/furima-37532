Rails.application.routes.draw do
  get 'purchase/management'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "items#index"
  resources :items do
  resources :purchase_managements, only:[:index, :create]
  resources :orders, only:[:create]
  end
end
