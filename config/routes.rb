# == Route Map
#
#  Prefix Verb URI Pattern            Controller#Action
#    root GET  /                      static_pages#home
#         POST /                      static_pages#home
#   about GET  /about(.:format)       static_pages#about
# contact GET  /contact(.:format)     static_pages#contact
# schools GET  /schools(.:format)     schools#index
#  school GET  /schools/:id(.:format) schools#show
#

Rails.application.routes.draw do
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  
  resources :schools, only: [:index, :show]
  
end
