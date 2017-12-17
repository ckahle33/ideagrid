Rails.application.routes.draw do
  root to: 'projects#index'
  resource :projects do
    collection do
      get 'me'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post'/users', to: 'users#create'
end
