Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: 'episodes#index'
  post '/signup', to: 'registrations#signup'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in?'

  resources :users, only: :show
  resources :episodes
  resources :episode_rooms do
    resources :chats
  end
end