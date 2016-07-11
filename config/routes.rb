Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'posts#index'
end
