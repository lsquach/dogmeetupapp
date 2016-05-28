Rails.application.routes.draw do
  root 'meetups#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  resources :users, except: [:new] do
    resources :meetups, except: [:show, :index, :create]
    resources :dogs, except: [:show]
  end

  resources :meetups, only: [:show, :index, :create]
  resources :dogs, only: [:show]

end
