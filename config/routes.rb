Rails.application.routes.draw do

  resources :users, only: [:create, :update] do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:create, :update, :destroy]
    resources :images, only: [:create, :update, :destroy]
  end

  get    '/login',  to: 'sessions#new',     as: 'login'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root 'sessions#index'
  get '/home', to: 'sessions#index', as: 'home'

end
