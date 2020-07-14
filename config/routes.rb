Rails.application.routes.draw do

  root 'application#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :addresses
  resources :products, :orders
  post "/checkout", to: "orders#checkout", as: :checkout

  #Rotas para as páginas de depositar e retirar dinheiro da conta
  resources :users do
    member do
      get :add_money
      get :retrieve_money
    end
  end
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
end