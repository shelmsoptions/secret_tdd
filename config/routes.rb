Rails.application.routes.draw do
  root "sessions#new"

  delete '/users' => 'users#destroy'

  resources :users

  delete '/sessions' => 'sessions#destroy'

  resources :sessions

  resources :secrets

end
