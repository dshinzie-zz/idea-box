Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end
  resources :categories

  get    '/login',  to: 'sessions#new',     as: 'login'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root 'sessions#index'
  get '/home', to: 'sessions#index', as: 'home'


end
