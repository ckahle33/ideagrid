require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'ideas#index'
  get "explore", to: "ideas#explore"
  resources :ideas do
    member do
      post 'vote'
      post 'comment', to: 'comments#create'
    end
    collection do
      get 'me'
      get 'voted'
    end
  end
  resources :suggestions, only: [:new, :create]
  resources :subscribers, only: [:create]
  resources :messages, only: [:index, :show, :new, :create] do
    member do
      post 'reply', to: 'messages#create'
    end
  end

  get '/tags/:id', to: 'tags#show', as: "tags"

  # auth
  get '/login',                  to: 'sessions#new'
  post '/login',                 to: 'sessions#create'
  get '/logout',                 to: 'sessions#destroy'
  get '/signup',                 to: 'users#new'
  get '/confirm/:token',         to: 'users#confirm'
  get '/forgot',                 to: 'users#forgot', as: 'forgot'
  post '/forgot_password',         to: 'users#forgot_password', as: 'forgot_password'
  get '/reset/:token',           to: 'users#reset', as: 'reset'
  patch '/reset_password/:token', to: 'users#reset_password', as: 'reset_password'
  resources :users

  mount Sidekiq::Web => '/sidekiq'

end
