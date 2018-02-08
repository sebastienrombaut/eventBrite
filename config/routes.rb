Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'users/show'

  resources :users

  get '/login', to: 'sessions#new'

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  root 'users#index'

end
