Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/locations/:id', to: 'location#show', as: 'location'
  post '/users/create', to: 'user#create'
  post '/login', to: 'auth#create'
  get '/auto_login', to: 'auth#auto_login'
  get '/interests', to: 'interest#share_all_interests'
  post '/interests', to: 'interest#add_interests_to_user'
end
