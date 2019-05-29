Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/locations/recommend', to: 'location#recommend_based_on_interests', as 'recommend'
  get '/locations/:id', to: 'location#show', as: 'location'
  get '/tags/:id', to: 'tag#show', as: 'tag'
  post '/tags/:id', to: 'tag#create', as: 'new_tag'
  get '/locations', to: 'location#index', as: 'locations'
  post '/locations', to: 'location#redirect', as: 'find_location'
  post '/users/create', to: 'user#create'
  get '/profile', to: 'user#show', as: 'show_user'
  post '/login', to: 'auth#create'
  get '/auto_login', to: 'auth#auto_login'
  get '/interests', to: 'interest#share_all_interests'
  post '/interests', to: 'interest#add_interests_to_user'
  get '/locationtags/:locationid/:tagid', to: 'location_tag#show', as: 'location_tag'
  delete '/locationtags/:id', to: 'location_tag#destroy', as: 'destroy_location_tag'
end
