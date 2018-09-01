# frozen_string_literal: true

class Queries::LoggedInUser < GraphQL::Schema::Resolver
  description 'A logged in user'
  type Types::UserType, null: false

  def resolve
    context[:current_user][]
  end
end
