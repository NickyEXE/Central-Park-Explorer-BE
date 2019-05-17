Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/locations/:id', to: 'location#show', as: 'location'
  post '/users/create', to: 'user#create'
  post '/login', to: 'auth#create'
end
