Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'payments/verify' => "payments#verify"
  resources :payments, only: [:new, :create]
  resources :products
  resources :categories
  devise_for :users , :controllers => { registrations: 'registrations' }
  
  root to: "products#index"
end
