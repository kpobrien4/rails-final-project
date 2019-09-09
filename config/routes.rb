Rails.application.routes.draw do
  resources :projects

  root to: 'home#index'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#post_login'
  get '/signup', to: 'sessions#signup'
  post '/signup', to: 'sessions#post_signup'
  delete 'logout', to: 'sessions#logout'

end
