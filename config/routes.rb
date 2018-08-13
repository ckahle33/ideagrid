require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'ideas#index'
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
  resources :users,              only: [:create, :update, :edit]

  mount Sidekiq::Web => '/sidekiq'

end
