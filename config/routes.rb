Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects do
    member do
      post 'vote'
    end
    collection do
      get 'me'
      get 'voted'
    end
  end

  get '/tags/:id', to: 'tags#show', as: "tags"

  # auth
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy'
  get '/signup',   to: 'users#new'
  resource :user, only: [:create, :update]
  get '/profile',   to: 'users#profile'

end
