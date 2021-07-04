Rails.application.routes.draw do

  root to: 'movies#index'

  resources :movies do
    resources :reviews
    resources :favorites
  end

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'
end
