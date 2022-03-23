Rails.application.routes.draw do

  
  # get '/events', to: "events#get_events"
  post "/graphql", to: "graphql#execute"

  resources :events

  resources :users



  # resources :users do
  #   resourses :user_events, only: [:create]
  # end

  # resourses :user_events


  resources :sessions

  resources :user_events, only: [:index, :create, :update, :delete, :show]



  get "/me", to: 'sessions#autologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
