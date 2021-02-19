Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  resources :users, only: %i[index create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  
  root 'user_sessions#new'
  resources :users
  resources :user_sessions
  
  get    '/login',   to: 'user_sessions#new', as: :login
  post   '/login',   to: 'user_sessions#create'
  post   '/logout',  to: 'user_sessions#destroy', as: :logout
end
