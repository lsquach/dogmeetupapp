Rails.application.routes.draw do
  root 'meetups#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  put "/meetups/:id", to: "meetups#add_dog"

  resources :users, except: [:new, :index] do
    resources :meetups, only: [:new]
    resources :dogs, only: [:new]
  end

  resources :meetups, except: [:new]
  resources :dogs, except: [:new]

end
