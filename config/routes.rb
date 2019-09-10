Rails.application.routes.draw do
  resources :skillsets
  resources :projects

  root to: 'home#index'

  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#post_login'

  get '/signup', to: 'sessions#signup', as: 'signup'
  post '/signup', to: 'sessions#post_signup'

  delete '/logout', to: 'sessions#logout', as: 'destroy_session'

end
