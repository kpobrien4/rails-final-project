Rails.application.routes.draw do
  resources :skillsets
  resources :projects

  root to: 'home#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'delete_user_session'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  resources :users, only: [] do
    resources :projects
  end


end
