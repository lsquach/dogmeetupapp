Rails.application.routes.draw do
  root 'meetups#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  resources :users, except: [:new] do
    resources :meetups, except: [:show, :index]
    resources :dogs, except: [:show]
  end

  resources :meetups, only: [:show, :index]
  resources :dogs, only: [:show]

end

# Prefix Verb   URI Pattern                                Controller#Action
#             root GET    /                                          meetups#index
#            login GET    /login(.:format)                           sessions#new
#                  POST   /login(.:format)                           sessions#create
#           logout GET    /logout(.:format)                          sessions#destroy
#           signup GET    /signup(.:format)                          users#new
#     user_meetups POST   /users/:user_id/meetups(.:format)          meetups#create
#  new_user_meetup GET    /users/:user_id/meetups/new(.:format)      meetups#new
# edit_user_meetup GET    /users/:user_id/meetups/:id/edit(.:format) meetups#edit
#      user_meetup PATCH  /users/:user_id/meetups/:id(.:format)      meetups#update
#                  PUT    /users/:user_id/meetups/:id(.:format)      meetups#update
#                  DELETE /users/:user_id/meetups/:id(.:format)      meetups#destroy
#        user_dogs GET    /users/:user_id/dogs(.:format)             dogs#index
#                  POST   /users/:user_id/dogs(.:format)             dogs#create
#     new_user_dog GET    /users/:user_id/dogs/new(.:format)         dogs#new
#    edit_user_dog GET    /users/:user_id/dogs/:id/edit(.:format)    dogs#edit
#         user_dog PATCH  /users/:user_id/dogs/:id(.:format)         dogs#update
#                  PUT    /users/:user_id/dogs/:id(.:format)         dogs#update
#                  DELETE /users/:user_id/dogs/:id(.:format)         dogs#destroy
#            users GET    /users(.:format)                           users#index
#                  POST   /users(.:format)                           users#create
#        edit_user GET    /users/:id/edit(.:format)                  users#edit
#             user GET    /users/:id(.:format)                       users#show
#                  PATCH  /users/:id(.:format)                       users#update
#                  PUT    /users/:id(.:format)                       users#update
#                  DELETE /users/:id(.:format)                       users#destroy
#          meetups GET    /meetups(.:format)                         meetups#index
#           meetup GET    /meetups/:id(.:format)                     meetups#show
#              dog GET    /dogs/:id(.:format)                        dogs#show
