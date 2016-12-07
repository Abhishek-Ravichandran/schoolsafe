# == Route Map
#
#             Prefix Verb   URI Pattern                                    Controller#Action
#               root GET    /                                              static_pages#home
#             filter POST   /filter(.:format)                              static_pages#filter
#          mapchange POST   /mapchange(.:format)                           static_pages#mapchange
#        crimefilter POST   /crimefilter(.:format)                         schools#crimefilter
#              about GET    /about(.:format)                               static_pages#about
#            contact GET    /contact(.:format)                             static_pages#contact
#             signup GET    /signup(.:format)                              users#new
#                    POST   /signup(.:format)                              users#create
#       sessions_new GET    /sessions/new(.:format)                        sessions#new
#              login GET    /login(.:format)                               sessions#new
#                    POST   /login(.:format)                               sessions#create
#             logout DELETE /logout(.:format)                              sessions#destroy
#     school_reviews GET    /schools/:school_id/reviews(.:format)          reviews#index
#                    POST   /schools/:school_id/reviews(.:format)          reviews#create
#  new_school_review GET    /schools/:school_id/reviews/new(.:format)      reviews#new
# edit_school_review GET    /schools/:school_id/reviews/:id/edit(.:format) reviews#edit
#      school_review GET    /schools/:school_id/reviews/:id(.:format)      reviews#show
#                    PATCH  /schools/:school_id/reviews/:id(.:format)      reviews#update
#                    PUT    /schools/:school_id/reviews/:id(.:format)      reviews#update
#                    DELETE /schools/:school_id/reviews/:id(.:format)      reviews#destroy
#    favorite_school POST   /schools/:id/favorite(.:format)                schools#favorite
#            schools GET    /schools(.:format)                             schools#index
#             school GET    /schools/:id(.:format)                         schools#show
#            reviews GET    /reviews(.:format)                             reviews#index
#                    POST   /reviews(.:format)                             reviews#create
#         new_review GET    /reviews/new(.:format)                         reviews#new
#        edit_review GET    /reviews/:id/edit(.:format)                    reviews#edit
#             review GET    /reviews/:id(.:format)                         reviews#show
#                    PATCH  /reviews/:id(.:format)                         reviews#update
#                    PUT    /reviews/:id(.:format)                         reviews#update
#                    DELETE /reviews/:id(.:format)                         reviews#destroy
#              users GET    /users(.:format)                               users#index
#                    POST   /users(.:format)                               users#create
#           new_user GET    /users/new(.:format)                           users#new
#          edit_user GET    /users/:id/edit(.:format)                      users#edit
#               user GET    /users/:id(.:format)                           users#show
#                    PATCH  /users/:id(.:format)                           users#update
#                    PUT    /users/:id(.:format)                           users#update
#                    DELETE /users/:id(.:format)                           users#destroy
#

Rails.application.routes.draw do
  get '/', to: 'static_pages#home', :as => 'root'
  post 'filter', to: 'static_pages#filter'
  post 'mapchange', to: 'static_pages#mapchange'
  post 'crimefilter', to: 'schools#crimefilter'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'sessions/new'
  get 'login',   to: 'sessions#new'
  post 'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  
  resources :schools, only: [:index, :show] do
    resources :reviews
    member do
      post 'favorite'
    end
  end
  resources :reviews
  resources :users
   
end
