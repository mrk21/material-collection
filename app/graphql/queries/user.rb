# frozen_string_literal: true

class Queries::User < GraphQL::Schema::Resolver
  description 'A user'
  argument :id, String, required: true
  type Types::UserType, null: false

  def resolve(id:)
    Loaders::RecordLoader.for(User).load(id)
  end
end
