Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  post '/login', to: 'sessions#create'

  get '/users/:id', to: 'users#show'
  post '/users/signup/', to: 'users#create'
  get '/current_user', to: 'users#current'

  post '/users/:user_id/workouts/new', to: 'workouts#create'
  get '/users/:user_id/workouts', to: 'workouts#index'
  get '/workouts/:id', to: 'workouts#show'
end
