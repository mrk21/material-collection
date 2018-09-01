# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    get '/graphql(/:opinfo)', to: 'graphql#execute', constraints: { opinfo: %r{[\w/]*} }
    post '/graphql(/:opinfo)', to: 'graphql#execute', constraints: { opinfo: %r{[\w/]*} }
    resource :session, only: %i[show create destroy]
  end
  mount GraphiQL::Rails::Engine, at: '/dev/graphiql', graphql_path: '/graphql'
end
