Rails.application.routes.draw do

  resources :favorites
  root to: 'movies#index'

  resources :movies do
    resources :reviews
  end

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'
end
