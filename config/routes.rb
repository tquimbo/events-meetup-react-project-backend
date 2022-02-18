Rails.application.routes.draw do

  
  # get '/events', to: "events#get_events"
  post "/graphql", to: "graphql#execute"

  resources :events do
    resources :user_events
  end

  resources :users do
    resources :user_events
  end

  resources :sessions
  resources :user_events



  get '/events/user/:id', to: 'events#user_events'
  get "/me", to: 'sessions#autologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
