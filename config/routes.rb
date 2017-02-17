Rails.application.routes.draw do
  root "sessions#new"

  delete '/users' => 'users#destroy'

  resources :users

  delete '/sessions' => 'sessions#destroy'

  resources :sessions

  # delete '/secrets/:id' => 'secrets#destroy'

  resources :secrets

  resources :likes

end
