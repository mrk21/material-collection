# frozen_string_literal: true

class Mutations::Base < GraphQL::Schema::Mutation
  include BaseResolver
end
