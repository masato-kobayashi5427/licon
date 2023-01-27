Rails.application.routes.draw do

  post '/signup', to: 'registrations#signup'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in?'

  get 'episodes', to: 'episodes#index'
  get 'episodes/new', to: 'episodes#new'
  post 'episodes/create', to: 'episodes#create'
end