Rails.application.routes.draw do
  resources :users, only: %i[index create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  
  root 'users#new'
  resources :users
  resources :sessions
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post   '/logout',  to: 'sessions#destroy'
end
