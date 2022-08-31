Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/teams/:id/players', to: 'team_players#index'

  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  get '/teams', to: 'teams#index'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'

  get '/teams/:id', to: 'teams#show'
end
