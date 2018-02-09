Rails.application.routes.draw do
  root 'static_pages#home'

  get 'events/show'

  get 'events/index'

  get 'events/new'

  get 'sessions/new'

  get 'users/new'

  get 'users/show'

  resources :users

  resources :events do
    post 'suscribe', on: :member
    post 'invite', on: :member
  end

  get '/login', to: 'sessions#new'

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"


end
