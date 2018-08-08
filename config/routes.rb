Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:show, :create, :destroy]
  resources :hoges, only: [:show] # dummy

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
