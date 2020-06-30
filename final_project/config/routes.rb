Rails.application.routes.draw do

  root 'application#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :products, :orders
  
end
