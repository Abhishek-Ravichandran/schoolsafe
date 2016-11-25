# == Route Map
#
#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           static_pages#home
#             POST   /                           static_pages#home
#       about GET    /about(.:format)            static_pages#about
#     contact GET    /contact(.:format)          static_pages#contact
#       login GET    /login(.:format)            static_pages#login
#      signup GET    /signup(.:format)           users#new
#     schools GET    /schools(.:format)          schools#index
#      school GET    /schools/:id(.:format)      schools#show
#     reviews GET    /reviews(.:format)          reviews#index
#             POST   /reviews(.:format)          reviews#create
#  new_review GET    /reviews/new(.:format)      reviews#new
# edit_review GET    /reviews/:id/edit(.:format) reviews#edit
#      review GET    /reviews/:id(.:format)      reviews#show
#             PATCH  /reviews/:id(.:format)      reviews#update
#             PUT    /reviews/:id(.:format)      reviews#update
#             DELETE /reviews/:id(.:format)      reviews#destroy
#       users GET    /users(.:format)            users#index
#             POST   /users(.:format)            users#create
#    new_user GET    /users/new(.:format)        users#new
#   edit_user GET    /users/:id/edit(.:format)   users#edit
#        user GET    /users/:id(.:format)        users#show
#             PATCH  /users/:id(.:format)        users#update
#             PUT    /users/:id(.:format)        users#update
#             DELETE /users/:id(.:format)        users#destroy
#

Rails.application.routes.draw do
  resources :schools, only: [:index, :show]
  resources :reviews
  resources :users
 
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'login', to: 'static_pages#login'
  get 'signup', to: 'users#new'

   
end
