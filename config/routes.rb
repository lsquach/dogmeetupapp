Rails.application.routes.draw do
  root 'meetups#index'

  resources :users do
    resources :meetups
  end

  resources :users do
    resources :dogs
  end
  
end
