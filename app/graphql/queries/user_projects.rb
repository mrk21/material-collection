# frozen_string_literal: true

class Queries::UserProjects < GraphQL::Schema::Resolver
  description 'Projects created by the user'
  argument :userId, String, required: true
  type [Types::ProjectType], null: false

  def resolve(user_id:)
    Loaders::RecordAssociationLoader.for(User, :projects).load(user_id)
  end
end
